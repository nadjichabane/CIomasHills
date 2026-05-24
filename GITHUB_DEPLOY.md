# GitHub Deployment Guide

Step-by-step instructions for deploying to GitHub Pages and managing your repository.

## 🚀 Quick Start

### 1. Create GitHub Repository
```bash
# Create new repository on GitHub
# Name: subsidized-housing
# Description: Modern landing page for subsidized housing in Ciomas, Bogor
# Public repository
# No README, .gitignore, or license
```

### 2. Initialize Local Repository
```bash
# Navigate to project folder
cd subsidized-housing-project

# Initialize git
git init

# Add all files
git add .

# Initial commit
git commit -m "Initial commit: Subsidized housing landing page"

# Add remote repository
git remote add origin https://github.com/YOUR-USERNAME/subsidized-housing.git

# Push to GitHub
git push -u origin main
```

## 📁 Repository Structure
```
subsidized-housing/
├── public/                    # Website files
│   ├── index.html            # Landing page
│   ├── admin.html            # Admin panel
│   ├── css/                  # Stylesheets
│   ├── js/                   # JavaScript files
│   └── images/               # Images
├── data/                     # JSON data files
├── scripts/                  # Utility scripts
├── config/                   # Configuration files
├── .gitignore               # Git ignore file
├── README.md                # Project documentation
├── DEPLOYMENT_GUIDE.md      # Deployment guide
├── vercel.json              # Vercel configuration
├── netlify.toml             # Netlify configuration
├── firebase.json            # Firebase configuration
└── package.json             # Node.js dependencies
```

## 🌐 GitHub Pages Deployment

### Option A: Deploy from `/docs` folder
1. Move files to `docs/` folder:
```bash
mv public/ docs/
```

2. Update references in HTML files:
```html
<!-- Change from: -->
<link rel="stylesheet" href="/css/styles.css">
<!-- To: -->
<link rel="stylesheet" href="css/styles.css">
```

3. Enable GitHub Pages:
   - Go to repository Settings
   - Navigate to "Pages"
   - Source: "Deploy from a branch"
   - Branch: "main" (or "master")
   - Folder: "/docs"
   - Save

### Option B: Deploy from root (Recommended)
1. Keep files in `public/`
2. Enable GitHub Pages:
   - Source: "Deploy from a branch"
   - Branch: "main"
   - Folder: "/public"
   - Save

### Option C: Use GitHub Actions
Create `.github/workflows/deploy.yml`:
```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [main]

permissions:
  contents: write
  pages: write
  id-token: write

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v3
        
      - name: Setup Pages
        uses: actions/configure-pages@v3
        
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v2
        with:
          path: 'public'
          
      - name: Deploy to GitHub Pages
        uses: actions/deploy-pages@v2
```

## 🔄 Continuous Deployment Workflow

### Automated Deployments
When you push to GitHub, automatically deploy to:

1. **Vercel**: [vercel.com](https://vercel.com)
2. **Netlify**: [netlify.com](https://netlify.com)
3. **GitHub Pages**: [pages.github.com](https://pages.github.com)

### Setting up Vercel
1. Sign up at [vercel.com](https://vercel.com)
2. Import your GitHub repository
3. Configure project:
   - Framework: Static
   - Build Command: (leave empty)
   - Output Directory: public
4. Deploy!

### Setting up Netlify
1. Sign up at [netlify.com](https://netlify.com)
2. Import from Git → GitHub
3. Configure:
   - Build command: `npm run build`
   - Publish directory: `public`
4. Deploy site

## 📦 Managing Dependencies

### Install Dependencies
```bash
npm install
```

### Development Server
```bash
npm start
```

### Build for Production
```bash
npm run build
```

## 🔒 Security Best Practices

### 1. Never Commit Sensitive Data
- Admin credentials
- API keys
- Personal information
- SSL certificates

### 2. Use .gitignore
Keep the provided `.gitignore` file intact.

### 3. Branch Protection
Enable branch protection in GitHub:
- Require pull request reviews
- Require status checks to pass
- Require linear history

## 📝 Commit Guidelines

### Conventional Commits
```
feat: add new gallery section
fix: correct mobile navigation bug
docs: update deployment guide
style: improve button hover effects
refactor: optimize image loading
test: add contact form validation tests
chore: update dependencies
```

### Example Workflow
```bash
# Start new feature
git checkout -b feature/new-gallery

# Make changes
git add .
git commit -m "feat: add interactive gallery with lightbox"

# Push branch
git push origin feature/new-gallery

# Create pull request on GitHub
```

## 🛠️ GitHub Actions for Automation

### 1. Automatic Testing
```yaml
name: Test

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm ci
      - run: npm run lint
      - run: npm test
```

### 2. Image Optimization
```yaml
name: Optimize Images

on:
  push:
    paths:
      - 'public/images/**'

jobs:
  optimize:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm ci
      - run: npm run optimize-images
      - uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: 'chore: optimize images'
```

## 🐛 Troubleshooting GitHub Pages

### Common Issues

#### 1. 404 Error on GitHub Pages
- Check folder structure
- Verify GitHub Pages source folder
- Ensure index.html exists

#### 2. CSS/JS Not Loading
- Check relative paths
- Clear browser cache
- Check GitHub Pages URL structure

#### 3. Domain Not Working
- Verify CNAME file (if using custom domain)
- Check DNS settings
- Wait for propagation (up to 48 hours)

#### 4. Admin Panel Not Accessible
- Ensure admin.html exists
- Check file permissions
- Verify authentication (if implemented)

## 📊 GitHub Insights

### Monitor Your Repository
1. **Insights → Traffic**: View page views and clones
2. **Insights → Contributors**: Track contributor activity
3. **Insights → Code frequency**: Code addition/deletion
4. **Insights → Dependency graph**: Monitor dependencies

### GitHub Pages Analytics
Add analytics to your site:
```html
<!-- Add to index.html -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

## 🔗 Useful GitHub Links

- **Repository**: `https://github.com/YOUR-USERNAME/subsidized-housing`
- **GitHub Pages**: `https://YOUR-USERNAME.github.io/subsidized-housing`
- **Actions**: `https://github.com/YOUR-USERNAME/subsidized-housing/actions`
- **Issues**: `https://github.com/YOUR-USERNAME/subsidized-housing/issues`
- **Projects**: `https://github.com/YOUR-USERNAME/subsidized-housing/projects`

## 📞 Support

### GitHub Issues
Create issues for:
- Bugs and problems
- Feature requests
- Questions about deployment

### GitHub Discussions
Use for:
- General questions
- Sharing ideas
- Community support

### Contact
- **Email**: support@perumahansubsidi.com
- **WhatsApp**: +6281234567890
- **GitHub Issue**: Create new issue in repository

---

**Next Steps**:
1. Create GitHub repository
2. Push code to GitHub
3. Enable GitHub Pages
4. Configure custom domain (optional)
5. Set up automated deployments

**Repository URL**: `https://github.com/YOUR-USERNAME/subsidized-housing`

**Live Site**: `https://YOUR-USERNAME.github.io/subsidized-housing`