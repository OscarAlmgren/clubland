#!/bin/bash

# Clubland - Deploy to Google Pixel 8
# This script deploys the app to your Pixel 8 for testing against Henrybook backend

set -e  # Exit on error

echo "🚀 Clubland - Deploying to Google Pixel 8"
echo "=========================================="

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Step 1: Check if device is connected
echo -e "\n${YELLOW}Step 1: Checking for connected devices...${NC}"
DEVICES=$(flutter devices 2>&1)

if echo "$DEVICES" | grep -q "Pixel"; then
    DEVICE_ID=$(flutter devices | grep "Pixel" | awk '{print $4}')
    echo -e "${GREEN}✓ Found Pixel 8: $DEVICE_ID${NC}"
else
    echo -e "${RED}✗ Pixel 8 not found!${NC}"
    echo ""
    echo "Please connect your Pixel 8 via USB and ensure:"
    echo "  1. USB debugging is enabled"
    echo "  2. You've authorized this computer on the phone"
    echo "  3. USB cable is properly connected"
    echo ""
    echo "Available devices:"
    flutter devices
    exit 1
fi

# Step 2: Check backend connectivity
echo -e "\n${YELLOW}Step 2: Checking Henrybook backend connectivity...${NC}"
if curl -s -o /dev/null -w "%{http_code}" http://192.168.0.170:30080/health | grep -q "200"; then
    echo -e "${GREEN}✓ Henrybook backend is reachable at 192.168.0.170:30080${NC}"

    # Show backend status
    HEALTH=$(curl -s http://192.168.0.170:30080/health)
    echo "Backend status: $(echo $HEALTH | grep -o '"status":"[^"]*"' | cut -d'"' -f4)"
else
    echo -e "${RED}✗ Cannot reach Henrybook backend!${NC}"
    echo ""
    echo "Please ensure:"
    echo "  1. Henrybook server is running at 192.168.0.170"
    echo "  2. Your Mac is on the same WiFi network"
    echo "  3. Your Pixel 8 is on the same WiFi network"
    echo ""
    read -p "Do you want to continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Step 3: Clean build
echo -e "\n${YELLOW}Step 3: Cleaning build artifacts...${NC}"
flutter clean > /dev/null 2>&1
echo -e "${GREEN}✓ Build cleaned${NC}"

# Step 4: Get dependencies
echo -e "\n${YELLOW}Step 4: Getting dependencies...${NC}"
flutter pub get > /dev/null 2>&1
echo -e "${GREEN}✓ Dependencies installed${NC}"

# Step 5: Deploy to device
echo -e "\n${YELLOW}Step 5: Deploying to Pixel 8...${NC}"
echo ""
echo "Configuration:"
echo "  Environment: development"
echo "  Backend: http://192.168.0.170:30080"
echo "  GraphQL: http://192.168.0.170:30080/graphql"
echo "  Device: $DEVICE_ID"
echo ""

# Choose deployment mode
echo "Select deployment mode:"
echo "  1) Debug mode with hot reload (recommended for testing)"
echo "  2) Profile mode (for performance testing)"
echo "  3) Release mode (production-like build)"
echo ""
read -p "Enter choice (1-3) [default: 1]: " MODE_CHOICE
MODE_CHOICE=${MODE_CHOICE:-1}

case $MODE_CHOICE in
    1)
        echo -e "\n${GREEN}Deploying in debug mode...${NC}"
        flutter run -d $DEVICE_ID
        ;;
    2)
        echo -e "\n${GREEN}Deploying in profile mode...${NC}"
        flutter run -d $DEVICE_ID --profile
        ;;
    3)
        echo -e "\n${GREEN}Building release APK...${NC}"
        flutter build apk --release
        echo -e "${GREEN}Installing on device...${NC}"
        flutter install -d $DEVICE_ID
        echo -e "${GREEN}✓ Release APK installed successfully!${NC}"
        ;;
    *)
        echo -e "${RED}Invalid choice. Exiting.${NC}"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}=========================================="
echo "✓ Deployment Complete!"
echo "==========================================${NC}"
echo ""
echo "Next steps:"
echo "  1. Open the app on your Pixel 8"
echo "  2. Try logging in or creating an account"
echo "  3. Test booking facilities"
echo "  4. Monitor logs with: flutter logs -d $DEVICE_ID"
echo ""
echo "GraphQL Playground (for manual testing):"
echo "  http://192.168.0.170:30080/graphql"
echo ""
