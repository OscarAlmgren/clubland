#!/bin/bash

# Setup script for GitHub Secrets and repository configuration
# This script helps set up all required secrets for the CI/CD pipeline

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Clubland CI/CD Setup Script${NC}"
echo "This script will guide you through setting up GitHub Secrets for the CI/CD pipeline."
echo

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
    echo -e "${RED}❌ GitHub CLI is not installed. Please install it first:${NC}"
    echo "https://cli.github.com/"
    exit 1
fi

# Check if user is logged in to GitHub CLI
if ! gh auth status &> /dev/null; then
    echo -e "${YELLOW}⚠️  Please log in to GitHub CLI first:${NC}"
    echo "gh auth login"
    exit 1
fi

# Get repository information
REPO=$(gh repo view --json nameWithOwner --jq .nameWithOwner)
echo -e "${GREEN}Setting up secrets for repository: $REPO${NC}"
echo

# Function to set a secret
set_secret() {
    local secret_name="$1"
    local description="$2"
    local is_required="$3"

    echo -e "${YELLOW}Setting up: $secret_name${NC}"
    echo "Description: $description"

    if [ "$is_required" = "true" ]; then
        echo -e "${RED}⚠️  This secret is required for the pipeline to work${NC}"
    fi

    echo -n "Enter value (or press Enter to skip): "
    read -s secret_value
    echo

    if [ -n "$secret_value" ]; then
        echo "$secret_value" | gh secret set "$secret_name"
        echo -e "${GREEN}✅ $secret_name set successfully${NC}"
    else
        echo -e "${YELLOW}⏭️  Skipped $secret_name${NC}"
    fi
    echo
}

# Environment Configuration
echo -e "${GREEN}📝 Environment Configuration${NC}"
set_secret "PROD_API_URL" "Production API URL (e.g., https://api.clubland.app)" "true"
set_secret "STAGING_API_URL" "Staging API URL (e.g., https://api-staging.clubland.app)" "false"
set_secret "PROD_ENCRYPTION_KEY" "Production encryption key (32 character string)" "true"
set_secret "STAGING_ENCRYPTION_KEY" "Staging encryption key (32 character string)" "false"

# Firebase Configuration
echo -e "${GREEN}🔥 Firebase Configuration${NC}"
set_secret "FIREBASE_SERVICE_ACCOUNT_PRODUCTION" "Firebase service account JSON for production" "false"
set_secret "FIREBASE_SERVICE_ACCOUNT_STAGING" "Firebase service account JSON for staging" "false"

# Google Play Store Configuration
echo -e "${GREEN}📱 Google Play Store Configuration${NC}"
set_secret "GOOGLE_PLAY_SERVICE_ACCOUNT" "Google Play service account JSON" "false"

# Apple App Store Configuration
echo -e "${GREEN}🍎 Apple App Store Configuration${NC}"
set_secret "SIGNING_CERTIFICATE_P12_DATA" "iOS signing certificate (base64 encoded P12)" "false"
set_secret "PROVISIONING_PROFILE_DATA" "iOS provisioning profile (base64 encoded)" "false"
set_secret "P12_PASSWORD" "Password for P12 certificate" "false"
set_secret "KEYCHAIN_PASSWORD" "Keychain password for CI" "false"
set_secret "APP_STORE_CONNECT_API_KEY" "App Store Connect API key" "false"
set_secret "APP_STORE_CONNECT_API_KEY_ID" "App Store Connect API key ID" "false"
set_secret "APP_STORE_CONNECT_ISSUER_ID" "App Store Connect issuer ID" "false"
set_secret "APPLE_ID_EMAIL" "Apple ID email for app upload" "false"
set_secret "APP_SPECIFIC_PASSWORD" "App-specific password for Apple ID" "false"

# AWS Configuration (for CDN deployment)
echo -e "${GREEN}☁️  AWS Configuration${NC}"
set_secret "AWS_ACCESS_KEY_ID" "AWS access key ID" "false"
set_secret "AWS_SECRET_ACCESS_KEY" "AWS secret access key" "false"
set_secret "S3_BUCKET" "S3 bucket name for web deployment" "false"
set_secret "CLOUDFRONT_DISTRIBUTION_ID" "CloudFront distribution ID" "false"

# Notification Configuration
echo -e "${GREEN}📢 Notification Configuration${NC}"
set_secret "SLACK_WEBHOOK" "Slack webhook URL for notifications" "false"
set_secret "EMAIL_USERNAME" "Email username for notifications" "false"
set_secret "EMAIL_PASSWORD" "Email password for notifications" "false"
set_secret "NOTIFICATION_EMAIL" "Email address to receive notifications" "false"

# Generate and set encryption key if not provided
echo -e "${GREEN}🔐 Generating Development Encryption Key${NC}"
DEV_ENCRYPTION_KEY=$(openssl rand -hex 16)
echo "$DEV_ENCRYPTION_KEY" | gh secret set "DEV_ENCRYPTION_KEY"
echo -e "${GREEN}✅ Development encryption key generated and set${NC}"
echo

# Set up repository settings
echo -e "${GREEN}⚙️  Setting up repository settings${NC}"

# Enable vulnerability alerts
gh api repos/$REPO --method PATCH --field has_vulnerability_alerts=true

# Enable security and analysis features
gh api repos/$REPO --method PATCH --field security_and_analysis='{"secret_scanning":{"status":"enabled"},"secret_scanning_push_protection":{"status":"enabled"}}'

echo -e "${GREEN}✅ Repository security features enabled${NC}"
echo

# Create environment protection rules
echo -e "${GREEN}🛡️  Setting up environment protection${NC}"
echo "Note: Environment protection rules need to be set up manually in the GitHub web interface:"
echo "1. Go to Settings > Environments"
echo "2. Create 'production' environment"
echo "3. Add protection rules (required reviewers, etc.)"
echo

# Final instructions
echo -e "${GREEN}🎉 Setup Complete!${NC}"
echo
echo -e "${YELLOW}📋 Next Steps:${NC}"
echo "1. Review all secrets in your repository settings"
echo "2. Set up environment protection rules manually"
echo "3. Configure branch protection rules for main/develop branches"
echo "4. Test the pipeline by creating a pull request"
echo
echo -e "${GREEN}💡 Tips:${NC}"
echo "• Keep your secrets secure and rotate them regularly"
echo "• Use separate keys/accounts for staging and production"
echo "• Monitor your pipeline runs and costs"
echo
echo -e "${GREEN}🔗 Useful Links:${NC}"
echo "• GitHub Secrets: https://github.com/$REPO/settings/secrets/actions"
echo "• Environments: https://github.com/$REPO/settings/environments"
echo "• Actions: https://github.com/$REPO/actions"