# Clubland Flutter App - Deployment Guide

## Overview

This guide covers the complete deployment process for the Clubland Flutter application across multiple platforms including mobile (iOS/Android), web, and desktop environments.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Environment Configuration](#environment-configuration)
- [Build Configuration](#build-configuration)
- [Mobile Deployment](#mobile-deployment)
- [Web Deployment](#web-deployment)
- [Desktop Deployment](#desktop-deployment)
- [CI/CD Pipeline](#cicd-pipeline)
- [Monitoring & Analytics](#monitoring--analytics)
- [Troubleshooting](#troubleshooting)

## Prerequisites

### Development Environment

```bash
# Required tools and versions
Flutter SDK: 3.16.0+
Dart SDK: 3.9.2+
Android Studio: Latest stable
Xcode: 15+ (for iOS deployment)
Docker: 20.10+ (for containerized deployments)
```

### Platform-Specific Requirements

#### iOS Deployment

- macOS development machine
- Active Apple Developer Program membership
- iOS signing certificates and provisioning profiles
- Xcode Command Line Tools

#### Android Deployment

- Android SDK 34+
- Play Console account
- Upload key and keystore file
- Google Play App Signing enabled

#### Web Deployment

- Domain name and SSL certificate
- CDN configuration (optional but recommended)
- Web server (Nginx, Apache, or cloud hosting)

## Environment Configuration

### Environment Variables

Create environment-specific configuration files:

```yaml
# config/development.yaml
environment: development
api_url: https://dev-api.clubland.com/graphql
ws_url: wss://dev-api.clubland.com/graphql
debug_mode: true
analytics_enabled: false

# config/staging.yaml
environment: staging
api_url: https://staging-api.clubland.com/graphql
ws_url: wss://staging-api.clubland.com/graphql
debug_mode: true
analytics_enabled: true

# config/production.yaml
environment: production
api_url: https://api.clubland.com/graphql
ws_url: wss://api.clubland.com/graphql
debug_mode: false
analytics_enabled: true
```

### Build Configuration

```dart
// lib/core/config/environment_config.dart
class EnvironmentConfig {
  static const String _envKey = 'ENVIRONMENT';

  static Environment get currentEnvironment {
    const envString = String.fromEnvironment(_envKey, defaultValue: 'development');
    return Environment.values.firstWhere(
      (e) => e.name == envString,
      orElse: () => Environment.development,
    );
  }

  static String get apiUrl {
    switch (currentEnvironment) {
      case Environment.production:
        return 'https://api.clubland.com/graphql';
      case Environment.staging:
        return 'https://staging-api.clubland.com/graphql';
      case Environment.development:
        return 'https://dev-api.clubland.com/graphql';
    }
  }
}

enum Environment { development, staging, production }
```

## Build Configuration

### Pre-build Setup

```bash
# 1. Clean previous builds
flutter clean

# 2. Get dependencies
flutter pub get

# 3. Generate required code
dart run build_runner build --delete-conflicting-outputs

# 4. Generate localization files
dart run intl_utils:generate

# 5. Run code analysis
flutter analyze

# 6. Run tests
flutter test
```

### Build Scripts

Create platform-specific build scripts:

```bash
#!/bin/bash
# scripts/build-android.sh

set -e

echo "Building Android release..."

# Environment setup
export ENVIRONMENT=production

# Build commands
flutter build appbundle \
  --release \
  --dart-define=ENVIRONMENT=production \
  --target-platform android-arm,android-arm64,android-x64

echo "Android build completed successfully!"
echo "Output: build/app/outputs/bundle/release/app-release.aab"
```

```bash
#!/bin/bash
# scripts/build-ios.sh

set -e

echo "Building iOS release..."

# Environment setup
export ENVIRONMENT=production

# Build commands
flutter build ios \
  --release \
  --dart-define=ENVIRONMENT=production \
  --no-codesign

echo "iOS build completed successfully!"
echo "Output: build/ios/iphoneos/Runner.app"
```

```bash
#!/bin/bash
# scripts/build-web.sh

set -e

echo "Building web release..."

# Environment setup
export ENVIRONMENT=production

# Build commands
flutter build web \
  --release \
  --dart-define=ENVIRONMENT=production \
  --web-renderer html \
  --base-href /

echo "Web build completed successfully!"
echo "Output: build/web/"
```

## Mobile Deployment

### Android Deployment

#### Google Play Store Deployment

1. **Configure Release Signing** (January 2025 Update)

**Application ID**: `com.reciprocalclubs.clubland`

**Keystore Setup**:

```bash
# Generate a new keystore (first time only)
keytool -genkey -v -keystore ~/clubland-release-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 -alias clubland

# Create key.properties file
cat > android/key.properties <<EOF
storeFile=/path/to/your/clubland-release-key.jks
storePassword=your_store_password
keyAlias=clubland
keyPassword=your_key_password
EOF
```

**Build Configuration** (`android/app/build.gradle.kts`):
- Automatic keystore detection from `key.properties`
- Fallback to debug signing if keystore not configured
- ProGuard enabled for release builds (code shrinking)
- Custom ProGuard rules in `android/app/proguard-rules.pro`

**Security Notes**:
- `key.properties` is gitignored (never commit)
- Example file provided: `android/key.properties.example`
- Store keystore password in secure password manager
- Back up keystore file securely (Google Play App Signing recommended)

2. **Prepare Release Build**

```bash
# Build release bundle (uses keystore from key.properties)
flutter build appbundle --release --dart-define=ENVIRONMENT=production

# Verify bundle
bundletool build-apks --bundle=build/app/outputs/bundle/release/app-release.aab \
  --output=clubland.apks

# Build APK for testing
flutter build apk --release --dart-define=ENVIRONMENT=production
```

3. **Upload to Play Console**

```bash
# Using fastlane (optional)
fastlane supply \
  --aab build/app/outputs/bundle/release/app-release.aab \
  --track internal \
  --release_status draft
```

4. **Release Configuration**

```yaml
# android/fastlane/Appfile
json_key_file("path/to/play-console-service-account.json")
package_name("com.clubland.app")

# android/fastlane/Fastfile
platform :android do
  desc "Deploy to internal track"
  lane :internal do
    gradle(task: "bundle", build_type: "Release")
    supply(
      track: "internal",
      aab: "../build/app/outputs/bundle/release/app-release.aab"
    )
  end
end
```

#### Firebase App Distribution (Beta)

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Deploy to App Distribution
firebase appdistribution:distribute \
  build/app/outputs/bundle/release/app-release.aab \
  --app 1:123456789:android:abcdef \
  --groups "internal-testers" \
  --release-notes "New release with latest features"
```

### iOS Deployment

#### App Store Connect Deployment

1. **Prepare iOS Build**

```bash
# Build for App Store
flutter build ios --release --dart-define=ENVIRONMENT=production

# Archive with Xcode
xcodebuild -workspace ios/Runner.xcworkspace \
  -scheme Runner \
  -sdk iphoneos \
  -configuration Release \
  archive -archivePath build/Runner.xcarchive
```

2. **Upload to App Store Connect**

```bash
# Export IPA
xcodebuild -exportArchive \
  -archivePath build/Runner.xcarchive \
  -exportOptionsPlist ios/ExportOptions.plist \
  -exportPath build/ios/ipa

# Upload using altool
xcrun altool --upload-app \
  --type ios \
  --file build/ios/ipa/Runner.ipa \
  --username "developer@clubland.com" \
  --password "@keychain:AC_PASSWORD"
```

3. **Fastlane Configuration**

```ruby
# ios/fastlane/Fastfile
platform :ios do
  desc "Upload to App Store Connect"
  lane :release do
    gym(
      scheme: "Runner",
      export_method: "app-store",
      export_options: {
        provisioningProfiles: {
          "com.clubland.app" => "Clubland App Store Profile"
        }
      }
    )

    upload_to_app_store(
      submit_for_review: false,
      automatic_release: false
    )
  end
end
```

## Web Deployment

### Static Hosting Deployment

#### Firebase Hosting

```json
// firebase.json
{
  "hosting": {
    "public": "build/web",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ],
    "headers": [
      {
        "source": "**",
        "headers": [
          {
            "key": "Cache-Control",
            "value": "public, max-age=31536000"
          }
        ]
      },
      {
        "source": "index.html",
        "headers": [
          {
            "key": "Cache-Control",
            "value": "no-cache, no-store, must-revalidate"
          }
        ]
      }
    ]
  }
}
```

```bash
# Deploy to Firebase Hosting
firebase deploy --only hosting
```

#### Docker Deployment

```dockerfile
# Dockerfile.web
FROM ghcr.io/cirruslabs/flutter:stable AS builder

WORKDIR /app
COPY . .

# Install dependencies and build
RUN flutter pub get
RUN dart run build_runner build --delete-conflicting-outputs
RUN flutter build web --release --dart-define=ENVIRONMENT=production

# Production image
FROM nginx:alpine

# Copy built web app
COPY --from=builder /app/build/web /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

```nginx
# nginx.conf
events {
    worker_connections 1024;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    server {
        listen 80;
        server_name localhost;
        root /usr/share/nginx/html;
        index index.html;

        # Enable gzip compression
        gzip on;
        gzip_types text/plain text/css application/json application/javascript text/xml application/xml;

        # Handle Flutter web routing
        location / {
            try_files $uri $uri/ /index.html;
        }

        # Security headers
        add_header X-Frame-Options DENY;
        add_header X-Content-Type-Options nosniff;
        add_header X-XSS-Protection "1; mode=block";
    }
}
```

```bash
# Build and deploy Docker container
docker build -f Dockerfile.web -t clubland-web .
docker run -p 80:80 clubland-web
```

### CDN Configuration

```yaml
# AWS CloudFront distribution
Resources:
  CloudFrontDistribution:
    Type: AWS::CloudFront::Distribution
    Properties:
      DistributionConfig:
        Origins:
          - DomainName: !GetAtt S3Bucket.RegionalDomainName
            Id: S3Origin
            S3OriginConfig:
              OriginAccessIdentity: !Sub "origin-access-identity/cloudfront/${OriginAccessIdentity}"
        Enabled: true
        DefaultRootObject: index.html
        DefaultCacheBehavior:
          TargetOriginId: S3Origin
          ViewerProtocolPolicy: redirect-to-https
          Compress: true
          CachePolicyId: 658327ea-f89d-4fab-a63d-7e88639e58f6 # Managed-CachingOptimized
        CustomErrorResponses:
          - ErrorCode: 404
            ResponseCode: 200
            ResponsePagePath: /index.html
```

## Desktop Deployment

### Windows Deployment

```bash
# Build Windows executable
flutter build windows --release --dart-define=ENVIRONMENT=production

# Create installer with Inno Setup
iscc installer/windows/clubland-installer.iss
```

### macOS Deployment

```bash
# Build macOS app
flutter build macos --release --dart-define=ENVIRONMENT=production

# Code signing
codesign --force --verify --verbose --sign "Developer ID Application: Your Name" \
  build/macos/Build/Products/Release/clubland.app

# Create DMG installer
create-dmg \
  --volname "Clubland" \
  --volicon "assets/icons/app_icon.icns" \
  --window-pos 200 120 \
  --window-size 800 400 \
  --icon-size 100 \
  --icon "clubland.app" 200 190 \
  --hide-extension "clubland.app" \
  --app-drop-link 600 185 \
  "clubland-installer.dmg" \
  "build/macos/Build/Products/Release/"
```

### Linux Deployment

```bash
# Build Linux executable
flutter build linux --release --dart-define=ENVIRONMENT=production

# Create AppImage
./tools/create-appimage.sh build/linux/x64/release/bundle/
```

## CI/CD Pipeline

### GitHub Actions Workflow

```yaml
# .github/workflows/deploy.yml
name: Deploy Clubland App

on:
  push:
    branches: [main]
    tags: ['v*']

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.16.0'

      - name: Install dependencies
        run: flutter pub get

      - name: Generate code
        run: dart run build_runner build --delete-conflicting-outputs

      - name: Run tests
        run: flutter test --coverage

      - name: Upload coverage
        uses: codecov/codecov-action@v3

  build-android:
    needs: test
    runs-on: ubuntu-latest
    if: startsWith(github.ref, 'refs/tags/v')
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
      - uses: actions/setup-java@v3
        with:
          distribution: 'temurin'
          java-version: '17'

      - name: Decode keystore
        run: echo "${{ secrets.ANDROID_KEYSTORE_BASE64 }}" | base64 -d > android/app/key.jks

      - name: Build Android release
        run: |
          flutter pub get
          dart run build_runner build --delete-conflicting-outputs
          flutter build appbundle --release --dart-define=ENVIRONMENT=production
        env:
          ANDROID_STORE_PASSWORD: ${{ secrets.ANDROID_STORE_PASSWORD }}
          ANDROID_KEY_PASSWORD: ${{ secrets.ANDROID_KEY_PASSWORD }}

      - name: Upload to Play Store
        uses: r0adkll/upload-google-play@v1
        with:
          serviceAccountJsonPlainText: ${{ secrets.GOOGLE_PLAY_SERVICE_ACCOUNT }}
          packageName: com.clubland.app
          releaseFiles: build/app/outputs/bundle/release/app-release.aab
          track: internal

  build-ios:
    needs: test
    runs-on: macos-latest
    if: startsWith(github.ref, 'refs/tags/v')
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2

      - name: Import certificates
        uses: apple-actions/import-codesign-certs@v1
        with:
          p12-file-base64: ${{ secrets.IOS_CERTIFICATE_BASE64 }}
          p12-password: ${{ secrets.IOS_CERTIFICATE_PASSWORD }}

      - name: Install provisioning profile
        run: |
          mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
          echo "${{ secrets.IOS_PROVISIONING_PROFILE_BASE64 }}" | base64 -d > ~/Library/MobileDevice/Provisioning\ Profiles/clubland.mobileprovision

      - name: Build iOS release
        run: |
          flutter pub get
          dart run build_runner build --delete-conflicting-outputs
          flutter build ios --release --dart-define=ENVIRONMENT=production --no-codesign
          xcodebuild -workspace ios/Runner.xcworkspace -scheme Runner -configuration Release -destination generic/platform=iOS -archivePath build/Runner.xcarchive archive

      - name: Export IPA
        run: |
          xcodebuild -exportArchive -archivePath build/Runner.xcarchive -exportOptionsPlist ios/ExportOptions.plist -exportPath build/ios/ipa

      - name: Upload to App Store Connect
        run: |
          xcrun altool --upload-app --type ios --file build/ios/ipa/Runner.ipa --username "${{ secrets.APPLE_ID_EMAIL }}" --password "${{ secrets.APPLE_ID_PASSWORD }}"

  build-web:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2

      - name: Build web release
        run: |
          flutter pub get
          dart run build_runner build --delete-conflicting-outputs
          flutter build web --release --dart-define=ENVIRONMENT=production

      - name: Deploy to Firebase Hosting
        uses: FirebaseExtended/action-hosting-deploy@v0
        with:
          repoToken: '${{ secrets.GITHUB_TOKEN }}'
          firebaseServiceAccount: '${{ secrets.FIREBASE_SERVICE_ACCOUNT }}'
          channelId: live
          projectId: clubland-app
```

### Environment Secrets

Configure the following secrets in your CI/CD environment:

```bash
# Android deployment
ANDROID_KEYSTORE_BASE64=<base64-encoded-keystore>
ANDROID_STORE_PASSWORD=<keystore-password>
ANDROID_KEY_PASSWORD=<key-password>
GOOGLE_PLAY_SERVICE_ACCOUNT=<service-account-json>

# iOS deployment
IOS_CERTIFICATE_BASE64=<base64-encoded-p12>
IOS_CERTIFICATE_PASSWORD=<certificate-password>
IOS_PROVISIONING_PROFILE_BASE64=<base64-encoded-profile>
APPLE_ID_EMAIL=<apple-id-email>
APPLE_ID_PASSWORD=<app-specific-password>

# Web deployment
FIREBASE_SERVICE_ACCOUNT=<firebase-service-account-json>

# Analytics and monitoring
FIREBASE_PROJECT_ID=<firebase-project-id>
SENTRY_DSN=<sentry-dsn>
```

## Monitoring & Analytics

### Performance Monitoring

```dart
// lib/core/monitoring/performance_monitor.dart
class PerformanceMonitor {
  static void trackAppLaunch() {
    FirebasePerformance.instance.newTrace('app_launch')
      ..start();
  }

  static void trackScreenView(String screenName) {
    FirebaseAnalytics.instance.logScreenView(screenName: screenName);
  }

  static void trackUserAction(String action, Map<String, dynamic> parameters) {
    FirebaseAnalytics.instance.logEvent(
      name: action,
      parameters: parameters,
    );
  }
}
```

### Error Tracking

```dart
// lib/core/monitoring/error_tracker.dart
class ErrorTracker {
  static void initialize() {
    FlutterError.onError = (FlutterErrorDetails details) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(details);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  static void recordError(dynamic error, StackTrace? stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  }

  static void setUserId(String userId) {
    FirebaseCrashlytics.instance.setUserIdentifier(userId);
  }
}
```

## Troubleshooting

### Common Deployment Issues

#### Build Failures

```bash
# Clear Flutter cache
flutter clean
flutter pub get
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs

# Update dependencies
flutter pub upgrade
flutter doctor
```

#### Code Signing Issues (iOS)

```bash
# Verify certificates
security find-identity -v -p codesigning

# Check provisioning profiles
ls ~/Library/MobileDevice/Provisioning\ Profiles/

# Reset codesigning
xcodebuild -workspace ios/Runner.xcworkspace -scheme Runner clean
```

#### Android Build Issues

```bash
# Clean Gradle cache
cd android && ./gradlew clean

# Update Gradle Wrapper
./gradlew wrapper --gradle-version 8.0

# Check Java version
java -version
```

### Performance Optimization

```bash
# Analyze bundle size
flutter build appbundle --analyze-size

# Profile app performance
flutter run --profile
flutter drive --profile test_driver/app.dart
```

### Deployment Verification

```bash
# Test builds locally
flutter run --release --dart-define=ENVIRONMENT=production

# Verify web deployment
python -m http.server 8000 -d build/web

# Test mobile builds
flutter install --release
```

## Security Considerations

### Code Obfuscation

```bash
# Build with obfuscation
flutter build appbundle --obfuscate --split-debug-info=build/debug-info/

# Build iOS with bitcode
flutter build ios --release --obfuscate --split-debug-info=build/debug-info/
```

### Secret Management

```dart
// Use environment variables for secrets
class SecretsConfig {
  static const String apiKey = String.fromEnvironment('API_KEY');
  static const String analyticsKey = String.fromEnvironment('ANALYTICS_KEY');

  static void validateSecrets() {
    if (apiKey.isEmpty) {
      throw Exception('API_KEY environment variable is required');
    }
  }
}
```

---

This deployment guide provides comprehensive coverage of deploying the Clubland Flutter application across all supported platforms with proper CI/CD integration, monitoring, and security considerations.
