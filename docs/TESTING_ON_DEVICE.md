# Testing Clubland on Google Pixel 8 with Henrybook Backend

## Quick Start Guide

Your app is **already configured** to connect to the Henrybook server at `192.168.0.170:30080`. Here's how to test it on your Pixel 8.

---

## Prerequisites

### 1. Network Setup ✅ CRITICAL

**Both devices MUST be on the same WiFi network:**

- **Henrybook Server**: Connected to network with IP `192.168.0.170`
- **Your Computer**: On the same WiFi network
- **Google Pixel 8**: On the same WiFi network

**Verify Henrybook is accessible:**
```bash
# From your Mac terminal
ping 192.168.0.170

# Check backend health
curl http://192.168.0.170:30080/health
```

Expected response:
```json
{
  "status": "healthy",
  "timestamp": "2025-10-31T12:00:00Z",
  "version": "v0.1.1",
  "services": {
    "database": "healthy",
    "redis": "healthy",
    "nats": "healthy"
  }
}
```

### 2. Enable USB Debugging on Pixel 8

1. Go to **Settings** → **About phone**
2. Tap **Build number** 7 times to enable Developer Options
3. Go back to **Settings** → **System** → **Developer options**
4. Enable **USB debugging**
5. Enable **Install via USB** (if available)

### 3. Connect Pixel 8 to Mac

```bash
# Connect via USB cable, then verify connection
flutter devices
```

You should see output like:
```
Pixel 8 (mobile) • 38131FDJH000R3 • android-arm64 • Android 14 (API 34)
```

---

## Deployment Methods

### Method 1: Direct USB Deploy (Recommended)

**This is the easiest method since your devices are on the same WiFi:**

```bash
# Navigate to project directory
cd /Users/oscaralmgren/dev/flutter-projects/clubland

# Clean build
flutter clean

# Get dependencies
flutter pub get

# Build and deploy to Pixel 8
flutter run -d 38131FDJH000R3
```

**The app will automatically connect to `http://192.168.0.170:30080/graphql`** ✅

### Method 2: Debug APK with Hot Reload

For faster iteration during testing:

```bash
# Run in debug mode with hot reload enabled
flutter run -d 38131FDJH000R3 --debug

# While running, you can:
# - Press 'r' to hot reload
# - Press 'R' to hot restart
# - Press 'h' for help
# - Press 'q' to quit
```

### Method 3: Release Build for Performance Testing

To test production-like performance:

```bash
# Build release APK
flutter build apk --release

# Install on Pixel 8
adb -s 38131FDJH000R3 install build/app/outputs/flutter-apk/app-release.apk
```

---

## Configuration (Already Set Up!)

Your app is pre-configured with these settings in `lib/core/config/environment_config.dart`:

```dart
// Default configuration (lines 56-65)
static String get apiBaseUrl => const String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://192.168.0.170:30080',  // ✅ Henrybook server
);

static String get graphqlEndpoint => const String.fromEnvironment(
  'GRAPHQL_ENDPOINT',
  defaultValue: 'http://192.168.0.170:30080/graphql',  // ✅ GraphQL endpoint
);
```

**No changes needed!** The app will connect automatically when both devices are on the same WiFi.

---

## Testing Workflow

### Step 1: Verify Backend Connectivity

Before deploying, ensure the backend is running:

```bash
# From your Mac terminal
curl http://192.168.0.170:30080/health
```

### Step 2: Deploy to Pixel 8

```bash
flutter run -d 38131FDJH000R3
```

### Step 3: Test GraphQL Operations

The app will automatically attempt to connect. You can test these operations:

**Authentication:**
- Login screen should appear
- Try registering a new user
- Try logging in

**Bookings:**
- View available facilities
- Check time slot availability
- Create a facility booking
- View upcoming bookings

**Members:**
- View member list
- Create member profile
- Update member information

**Clubs:**
- Browse clubs
- View club details
- Check reciprocal agreements

**Real-time Features:**
- Booking updates (WebSocket subscription)
- Notifications
- Visit status changes

### Step 4: Monitor Logs

**On Mac terminal:**
```bash
# Watch Flutter logs in real-time
flutter logs -d 38131FDJH000R3

# Or use adb logcat for Android-specific logs
adb -s 38131FDJH000R3 logcat -s flutter
```

**Look for these log messages:**
```
[INFO] GraphQL client initialized with baseUrl: http://192.168.0.170:30080
[DEBUG] GraphQL Request: Login
[DEBUG] Variables: {email: user@example.com, password: ***}
[DEBUG] GraphQL Response: {login: {token: ..., user: {...}}}
```

---

## Troubleshooting

### Issue 1: Connection Timeout

**Symptoms:**
- App hangs on loading screen
- "Network error" messages
- GraphQL operations fail

**Solutions:**

1. **Verify WiFi connection:**
   ```bash
   # From Mac
   ping 192.168.0.170

   # From Pixel 8
   # Settings → WiFi → Check connected network matches Mac
   ```

2. **Check Henrybook is running:**
   ```bash
   curl http://192.168.0.170:30080/health
   ```

3. **Restart backend services:**
   ```bash
   # SSH into henrybook server
   kubectl get pods -n reciprocal-clubs

   # Check if all services are running
   # If not, restart failed pods
   ```

4. **Increase timeouts for slower networks:**
   ```bash
   # Run with custom timeouts
   flutter run -d 38131FDJH000R3 \
     --dart-define=CONNECT_TIMEOUT=30000 \
     --dart-define=RECEIVE_TIMEOUT=60000
   ```

### Issue 2: GraphQL Errors

**Symptoms:**
- "UNAUTHENTICATED" errors
- "FORBIDDEN" errors
- Empty responses

**Solutions:**

1. **Check GraphQL Playground:**
   - Open browser: `http://192.168.0.170:30080/graphql`
   - Test queries manually
   - Verify schema is loaded

2. **Clear app data:**
   ```bash
   # Uninstall and reinstall
   adb -s 38131FDJH000R3 uninstall com.reciprocalclubs.clubland
   flutter run -d 38131FDJH000R3
   ```

3. **Enable verbose GraphQL logging:**

   The app already has logging enabled in development mode (see `graphql_client.dart:45-46`).
   Watch the Flutter logs for detailed GraphQL requests/responses.

### Issue 3: WebSocket Subscriptions Not Working

**Symptoms:**
- Real-time updates don't appear
- Subscription errors in logs

**Solutions:**

1. **Verify WebSocket endpoint:**
   ```bash
   # Test WebSocket connection
   wscat -c ws://192.168.0.170:30080/graphql
   ```

2. **Check firewall rules** on Henrybook server:
   - WebSocket connections might be blocked
   - Ensure port 30080 allows WS/WSS connections

3. **Fallback to polling** (if WebSockets fail):

   Modify query policies to use polling instead:
   ```dart
   // In lib/core/network/graphql_client.dart
   // Change watchQuery policy to use polling
   ```

### Issue 4: CORS or Network Policy Issues

**Symptoms:**
- "Access-Control-Allow-Origin" errors
- "Network policy" errors

**Solutions:**

Since you're using a real device on the same network, CORS should not be an issue. However:

1. **Verify API Gateway configuration** on Henrybook allows connections from local network
2. **Check Kubernetes network policies** don't block local network access
3. **Ensure API Gateway is exposed correctly** via NodePort/LoadBalancer

---

## Advanced Testing

### Test with Different Environments

```bash
# Development (default - Henrybook server)
flutter run -d 38131FDJH000R3

# Staging (if you have a staging server)
flutter run -d 38131FDJH000R3 \
  --dart-define=ENVIRONMENT=staging \
  --dart-define=API_BASE_URL=http://staging-server-ip:30080

# Production
flutter run -d 38131FDJH000R3 \
  --dart-define=ENVIRONMENT=production \
  --dart-define=API_BASE_URL=https://api.production-domain.com
```

### Performance Testing

```bash
# Build release APK for performance testing
flutter build apk --release

# Install and test
adb -s 38131FDJH000R3 install build/app/outputs/flutter-apk/app-release.apk

# Monitor performance
adb -s 38131FDJH000R3 shell dumpsys gfxinfo com.reciprocalclubs.clubland
```

### Network Monitoring

Monitor all HTTP/GraphQL traffic from the app:

```bash
# Use Charles Proxy or similar
# Configure WiFi proxy on Pixel 8:
# Settings → Network → WiFi → Advanced → Proxy → Manual
# Host: Your Mac's IP
# Port: 8888
```

---

## Sample Test Scenarios

### Scenario 1: User Registration & Login

1. Launch app on Pixel 8
2. Tap "Sign Up"
3. Enter user details:
   - Email: `test@clubland.com`
   - Password: `Test123!`
   - First Name: `Test`
   - Last Name: `User`
4. Tap "Register"
5. Verify you're redirected to home screen
6. Log out
7. Log back in with same credentials

**Expected:** All operations should complete successfully with backend at `192.168.0.170:30080`

### Scenario 2: Browse Facilities & Create Booking

1. Navigate to "Bookings" tab
2. Tap "Browse Facilities"
3. View list of facilities from backend
4. Select "Tennis Court 1"
5. Tap "Check Availability"
6. Select available time slot
7. Tap "Book Now"
8. Verify booking appears in "My Bookings"

**Expected:** Real-time data from Henrybook backend

### Scenario 3: Real-time Notifications

1. Keep app open on booking details screen
2. From another device/browser, update the booking status
3. Verify notification appears on Pixel 8 in real-time via WebSocket

**Expected:** Instant update via subscription

---

## Performance Expectations

**On Google Pixel 8 with WiFi connection to Henrybook:**

- **App launch**: < 2 seconds
- **GraphQL queries**: < 500ms (local network)
- **Mutations**: < 1 second
- **Subscriptions**: Real-time (< 100ms latency)
- **UI responsiveness**: 60 FPS

**If performance is slower:**
- Check WiFi signal strength
- Verify Henrybook server load (kubectl top pods)
- Check network congestion

---

## Quick Commands Reference

```bash
# Deploy to Pixel 8
flutter run -d 38131FDJH000R3

# Watch logs
flutter logs -d 38131FDJH000R3

# Hot reload (while running)
# Press 'r' in terminal

# Restart app
# Press 'R' in terminal

# Check connected devices
flutter devices

# Test backend connectivity
curl http://192.168.0.170:30080/health

# GraphQL Playground (in browser)
open http://192.168.0.170:30080/graphql

# Uninstall app from Pixel 8
adb -s 38131FDJH000R3 uninstall com.reciprocalclubs.clubland

# Install release APK
adb -s 38131FDJH000R3 install build/app/outputs/flutter-apk/app-release.apk
```

---

## Expected Results

When successfully connected to Henrybook backend:

✅ Login/Registration works with backend auth service
✅ Facilities list loads from booking service
✅ Bookings can be created and retrieved
✅ Member profiles can be viewed/edited
✅ Clubs data loads correctly
✅ Real-time updates via WebSocket subscriptions
✅ Notifications appear
✅ Analytics data displays

---

## Summary

**Your setup is READY!** 🚀

1. **Pixel 8 on same WiFi as Henrybook** (192.168.0.170)
2. **App pre-configured** with correct backend URL
3. **All 59 GraphQL operations** ready to test
4. **Simply run:** `flutter run -d 38131FDJH000R3`

The app will automatically connect to the Henrybook GraphQL server and you can test all features immediately!

---

**Happy Testing! 🎉**
