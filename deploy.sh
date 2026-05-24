#!/bin/bash

# Deploy script for CiomasHills subsidized housing project

set -e

echo "🚀 Starting deployment process for CiomasHills..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check for required tools
check_tools() {
    echo -e "${BLUE}🔧 Checking required tools...${NC}"
    
    local missing_tools=()
    
    for tool in git node npm curl; do
        if ! command -v $tool &> /dev/null; then
            missing_tools+=($tool)
        fi
    done
    
    if [ ${#missing_tools[@]} -gt 0 ]; then
        echo -e "${RED}❌ Missing tools: ${missing_tools[*]}${NC}"
        echo "Please install them before proceeding."
        exit 1
    fi
    
    echo -e "${GREEN}✅ All required tools are available${NC}"
}

# Build the project
build_project() {
    echo -e "${BLUE}📦 Building project...${NC}"
    
    if [ ! -f "package.json" ]; then
        echo -e "${RED}❌ package.json not found${NC}"
        exit 1
    fi
    
    npm ci
    npm run build
    
    echo -e "${GREEN}✅ Build completed successfully${NC}"
}

# Deploy to Vercel
deploy_vercel() {
    echo -e "${BLUE}🚀 Deploying to Vercel...${NC}"
    
    if ! command -v vercel &> /dev/null; then
        echo -e "${YELLOW}⚠️  Vercel CLI not found, installing...${NC}"
        npm install -g vercel
    fi
    
    echo -e "${YELLOW}📝 Choose deployment options:${NC}"
    echo "1. Preview deployment (for testing)"
    echo "2. Production deployment"
    echo "3. Cancel"
    
    read -p "Enter choice (1-3): " choice
    
    case $choice in
        1)
            echo -e "${BLUE}🚀 Starting preview deployment...${NC}"
            vercel --prod
            ;;
        2)
            echo -e "${BLUE}🚀 Starting production deployment...${NC}"
            vercel --prod --confirm
            ;;
        3)
            echo -e "${YELLOW}Deployment cancelled${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice${NC}"
            exit 1
            ;;
    esac
    
    echo -e "${GREEN}✅ Deployment initiated${NC}"
}

# Setup GitHub repository
setup_github() {
    echo -e "${BLUE}🐙 Setting up GitHub repository...${NC}"
    
    if [ ! -d ".git" ]; then
        echo -e "${YELLOW}⚠️  Git repository not initialized${NC}"
        git init
        git add .
        git commit -m "Initial commit: CiomasHills subsidized housing project"
        
        read -p "Enter GitHub repository URL (e.g., https://github.com/nadjichabane/CiomasHills.git): " repo_url
        
        if [ -n "$repo_url" ]; then
            git remote add origin "$repo_url"
            echo -e "${GREEN}✅ GitHub remote added${NC}"
        else
            echo -e "${YELLOW}⚠️  No repository URL provided, skipping remote setup${NC}"
        fi
    else
        echo -e "${GREEN}✅ Git repository already initialized${NC}"
    fi
}

# Create environment file template
create_env_template() {
    echo -e "${BLUE}📄 Creating environment template...${NC}"
    
    cat > .env.example << 'EOF'
# Vercel Deployment
VERCEL_ORG_ID=your_org_id_here
VERCEL_PROJECT_ID=your_project_id_here

# GitHub Secrets (for CI/CD)
# Add these in GitHub Repository Settings > Secrets and variables > Actions
# - VERCEL_TOKEN
# - VERCEL_ORG_ID  
# - VERCEL_PROJECT_ID

# Application Settings
SITE_URL=https://ciomashills.vercel.app
CONTACT_PHONE=+6281234567890
CONTACT_EMAIL=marketing@ciomashills.com

# Analytics (optional)
GOOGLE_ANALYTICS_ID=UA-XXXXXXXXX-X
FACEBOOK_PIXEL_ID=XXXXXXXXXXXXXXX
EOF
    
    echo -e "${GREEN}✅ Environment template created (.env.example)${NC}"
    echo -e "${YELLOW}⚠️  Remember to create .env file with your actual values${NC}"
}

# Main deployment flow
main() {
    echo -e "${GREEN}🏠 CiomasHills Subsidized Housing Project Deployment${NC}"
    echo "================================================"
    
    # Check tools
    check_tools
    
    # Setup GitHub
    setup_github
    
    # Build project
    build_project
    
    # Create env template
    create_env_template
    
    # Ask about deployment
    echo ""
    read -p "Do you want to deploy now? (y/n): " deploy_now
    
    if [[ $deploy_now =~ ^[Yy]$ ]]; then
        deploy_vercel
    else
        echo -e "${YELLOW}⚠️  Deployment skipped${NC}"
        echo -e "${BLUE}📋 Next steps:${NC}"
        echo "1. Update .env.example with your values and save as .env"
        echo "2. Push to GitHub: git push -u origin main"
        echo "3. Setup Vercel project at https://vercel.com"
        echo "4. Add secrets to GitHub Actions"
    fi
    
    echo ""
    echo -e "${GREEN}✅ Deployment preparation completed!${NC}"
    echo ""
    echo -e "${BLUE}📚 Useful commands:${NC}"
    echo "  ./deploy.sh                    - Run this script again"
    echo "  npm start                      - Start local development server"
    echo "  npm run build                  - Build for production"
    echo "  npm run deploy                 - Deploy to Vercel"
    echo "  git add . && git commit -m ''  - Commit changes"
    echo ""
    echo -e "${GREEN}🚀 Happy deploying!${NC}"
}

# Run main function
main "$@"