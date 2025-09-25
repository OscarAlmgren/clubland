#!/bin/bash

# Deployment script for Clubland application
# Supports web, Android, and iOS deployments

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
FLUTTER_VERSION="3.19.0"
PROJECT_NAME="clubland"

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}"
}

# Function to check prerequisites
check_prerequisites() {
    print_header "Checking Prerequisites"

    # Check Flutter installation
    if ! command -v flutter &> /dev/null; then
        print_error "Flutter is not installed or not in PATH"
        exit 1
    fi

    # Check Flutter version
    CURRENT_VERSION=$(flutter --version | grep "Flutter" | awk '{print $2}')
    print_status "Flutter version: $CURRENT_VERSION"

    # Check if on correct channel
    CHANNEL=$(flutter channel | grep "*" | awk '{print $2}')
    if [ "$CHANNEL" != "stable" ]; then
        print_warning "Not on stable channel (currently on $CHANNEL)"
        read -p "Switch to stable channel? (y/n): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            flutter channel stable
            flutter upgrade
        fi
    fi

    print_status "Prerequisites check completed"
}

# Function to setup environment
setup_environment() {
    print_header "Setting Up Environment"

    # Get dependencies
    print_status "Getting Flutter dependencies..."
    flutter pub get

    # Generate code
    print_status "Generating code..."
    flutter packages pub run build_runner build --delete-conflicting-outputs

    if command -v dart &> /dev/null && flutter packages pub deps | grep -q "intl_utils"; then
        dart run intl_utils:generate
    fi

    print_status "Environment setup completed"
}

# Function to run tests
run_tests() {
    print_header "Running Tests"

    print_status "Running unit tests..."
    flutter test --coverage

    # Check test results
    if [ $? -ne 0 ]; then
        print_error "Tests failed! Aborting deployment."
        exit 1
    fi

    print_status "All tests passed"
}

# Function to run analysis
run_analysis() {
    print_header "Running Code Analysis"

    print_status "Checking code format..."
    dart format --output=none --set-exit-if-changed .

    print_status "Running Flutter analyze..."
    flutter analyze --fatal-infos --fatal-warnings

    print_status "Code analysis completed"
}

# Function to deploy to web
deploy_web() {
    print_header "Deploying Web Application"

    local environment=${1:-staging}
    local api_url=""
    local encryption_key=""

    case $environment in
        "production")
            api_url=${PROD_API_URL:-"https://api.clubland.app"}
            encryption_key=${PROD_ENCRYPTION_KEY:-""}
            ;;
        "staging")
            api_url=${STAGING_API_URL:-"https://api-staging.clubland.app"}
            encryption_key=${STAGING_ENCRYPTION_KEY:-"dev_key_32_chars_long_example"}
            ;;
        *)
            print_error "Invalid environment: $environment"
            exit 1
            ;;
    esac

    print_status "Building web app for $environment..."
    flutter build web --release \
        --dart-define=ENVIRONMENT=$environment \
        --dart-define=API_URL="$api_url" \
        --dart-define=ENCRYPTION_KEY="$encryption_key" \
        --tree-shake-icons

    # Deploy to Firebase (if configured)
    if command -v firebase &> /dev/null && [ -f "firebase.json" ]; then
        print_status "Deploying to Firebase Hosting..."

        if [ "$environment" = "production" ]; then
            firebase deploy --only hosting:production
        else
            firebase deploy --only hosting:staging
        fi
    else
        print_warning "Firebase CLI not found or not configured"
        print_status "Web build completed. Files are in build/web/"
    fi
}

# Function to build Android
build_android() {
    print_header "Building Android Application"

    local environment=${1:-staging}
    local api_url=""
    local encryption_key=""

    case $environment in
        "production")
            api_url=${PROD_API_URL:-"https://api.clubland.app"}
            encryption_key=${PROD_ENCRYPTION_KEY:-""}
            ;;
        "staging")
            api_url=${STAGING_API_URL:-"https://api-staging.clubland.app"}
            encryption_key=${STAGING_ENCRYPTION_KEY:-"dev_key_32_chars_long_example"}
            ;;
        *)
            print_error "Invalid environment: $environment"
            exit 1
            ;;
    esac

    print_status "Building Android APK for $environment..."
    flutter build apk --release \
        --dart-define=ENVIRONMENT=$environment \
        --dart-define=API_URL="$api_url" \
        --dart-define=ENCRYPTION_KEY="$encryption_key"

    print_status "Building Android App Bundle for $environment..."
    flutter build appbundle --release \
        --dart-define=ENVIRONMENT=$environment \
        --dart-define=API_URL="$api_url" \
        --dart-define=ENCRYPTION_KEY="$encryption_key"

    print_status "Android build completed"
    print_status "APK: build/app/outputs/flutter-apk/app-release.apk"
    print_status "App Bundle: build/app/outputs/bundle/release/app-release.aab"
}

# Function to build iOS
build_ios() {
    print_header "Building iOS Application"

    if [[ "$OSTYPE" != "darwin"* ]]; then
        print_error "iOS builds are only supported on macOS"
        exit 1
    fi

    local environment=${1:-staging}
    local api_url=""
    local encryption_key=""

    case $environment in
        "production")
            api_url=${PROD_API_URL:-"https://api.clubland.app"}
            encryption_key=${PROD_ENCRYPTION_KEY:-""}
            ;;
        "staging")
            api_url=${STAGING_API_URL:-"https://api-staging.clubland.app"}
            encryption_key=${STAGING_ENCRYPTION_KEY:-"dev_key_32_chars_long_example"}
            ;;
        *)
            print_error "Invalid environment: $environment"
            exit 1
            ;;
    esac

    print_status "Building iOS application for $environment..."
    flutter build ios --release \
        --dart-define=ENVIRONMENT=$environment \
        --dart-define=API_URL="$api_url" \
        --dart-define=ENCRYPTION_KEY="$encryption_key"

    print_status "iOS build completed"
    print_status "Build location: build/ios/iphoneos/"
}

# Function to show help
show_help() {
    echo "Clubland Deployment Script"
    echo ""
    echo "Usage: $0 [COMMAND] [ENVIRONMENT]"
    echo ""
    echo "Commands:"
    echo "  web         Deploy web application"
    echo "  android     Build Android application"
    echo "  ios         Build iOS application"
    echo "  all         Build all platforms"
    echo "  test        Run tests only"
    echo "  analyze     Run code analysis only"
    echo "  help        Show this help message"
    echo ""
    echo "Environments:"
    echo "  staging     Deploy to staging environment (default)"
    echo "  production  Deploy to production environment"
    echo ""
    echo "Examples:"
    echo "  $0 web staging          # Deploy web app to staging"
    echo "  $0 android production   # Build Android for production"
    echo "  $0 all staging          # Build all platforms for staging"
    echo ""
    echo "Environment Variables:"
    echo "  PROD_API_URL           Production API URL"
    echo "  STAGING_API_URL        Staging API URL"
    echo "  PROD_ENCRYPTION_KEY    Production encryption key"
    echo "  STAGING_ENCRYPTION_KEY Staging encryption key"
}

# Main execution
main() {
    local command=${1:-help}
    local environment=${2:-staging}

    case $command in
        "web")
            check_prerequisites
            setup_environment
            run_tests
            run_analysis
            deploy_web "$environment"
            ;;
        "android")
            check_prerequisites
            setup_environment
            run_tests
            run_analysis
            build_android "$environment"
            ;;
        "ios")
            check_prerequisites
            setup_environment
            run_tests
            run_analysis
            build_ios "$environment"
            ;;
        "all")
            check_prerequisites
            setup_environment
            run_tests
            run_analysis
            deploy_web "$environment"
            build_android "$environment"
            build_ios "$environment"
            ;;
        "test")
            check_prerequisites
            setup_environment
            run_tests
            ;;
        "analyze")
            check_prerequisites
            setup_environment
            run_analysis
            ;;
        "help"|"--help"|"-h")
            show_help
            ;;
        *)
            print_error "Unknown command: $command"
            show_help
            exit 1
            ;;
    esac

    print_header "Deployment Complete"
    print_status "Command '$command' executed successfully"
}

# Run main function with all arguments
main "$@"