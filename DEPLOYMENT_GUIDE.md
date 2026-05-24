# Deployment Guide - Perumahan Subsidi Ciomas Bogor

Step-by-step guide to deploy your subsidized housing landing page and admin panel.

## 📋 Table of Contents
1. [Prerequisites](#prerequisites)
2. [Deployment Options](#deployment-options)
3. [Step-by-Step Deployment](#step-by-step-deployment)
4. [Configuration](#configuration)
5. [Domain Setup](#domain-setup)
6. [SSL Setup](#ssl-setup)
7. [Maintenance](#maintenance)
8. [Troubleshooting](#troubleshooting)

## 🛠️ Prerequisites

### Required Accounts
- GitHub account (for version control)
- Hosting provider account (choose one):
  - [Vercel](https://vercel.com) (Recommended - Free tier available)
  - [Netlify](https://netlify.com) (Free tier available)
  - [GitHub Pages](https://pages.github.com) (Free)
  - [Firebase Hosting](https://firebase.google.com) (Free tier available)
  - Traditional web hosting (cPanel, etc.)

### Technical Requirements
- Basic knowledge of Git
- Modern web browser
- Text editor (VS Code recommended)

## 🚀 Deployment Options

### Option 1: Vercel (Easiest & Recommended)
**Pros:**
- Free tier with 100GB bandwidth/month
- Automatic SSL
- Automatic deployments from GitHub
- Global CDN
- Easy custom domain setup

**Steps:**
1. Push code to GitHub
2. Import project in Vercel
3. Configure settings
4. Deploy

### Option 2: Netlify
**Pros:**
- Free tier available
- Easy Git integration
- Forms handling
- Serverless functions

### Option 3: GitHub Pages
**Pros:**
- Completely free
- Integrated with GitHub
- Simple setup

**Cons:**
- No server-side processing
- Limited features

### Option 4: Traditional Web Hosting
**For:** cPanel, Plesk, or FTP-based hosting

## 📝 Step-by-Step Deployment

### Step 1: Prepare Your Code
```bash
# Clone or copy your project files
git clone [your-repository-url]
cd subsidized-housing-project

# Verify project structure
ls -la
```

### Step 2: Push to GitHub
```bash
# Initialize Git repository
git init
git add .
git commit -m "Initial commit: Subsidized housing landing page"

# Connect to GitHub
git remote add origin https://github.com/yourusername/subsidized-housing.git
git push -u origin main
```

### Step 3: Deploy to Vercel (Recommended)

#### Method A: Vercel Dashboard
1. Go to [vercel.com](https://vercel.com)
2. Click "Add New..." → "Project"
3. Import your GitHub repository
4. Configure project:
   - **Framework Preset**: Static
   - **Build Command**: Leave empty
   - **Output Directory**: public
   - **Install Command**: Leave empty
5. Click "Deploy"

#### Method B: Vercel CLI
```bash
# Install Vercel CLI
npm install -g vercel

# Login to Vercel
vercel login

# Deploy
vercel --prod
```

### Step 4: Configure Custom Domain (Optional)
1. In Vercel dashboard, go to "Domains"
2. Add your domain (e.g., `perumahansubsidi-ciomas.com`)
3. Update DNS records as instructed
4. Wait for propagation (5-30 minutes)

## ⚙️ Configuration

### 1. Update Contact Information
Edit `data/contact.json`:
```json
{
  "whatsapp": "+6281234567890",
  "address": "Jl. Raya Ciomas No. 123, Ciomas, Bogor",
  "email": "marketing@perumahansubsidi.com",
  "instagram": "@perumahansubsidi_ciomas",
  "facebook": "Perumahan Subsidi Ciomas Bogor"
}
```

### 2. Update Property Details
Edit `data/specifications.json`:
```json
{
  "type": "30/60",
  "bedrooms": 2,
  "bathrooms": 1,
  "electricity": "1300 Watt",
  "water": "PDAM",
  "price": "Mulai Rp 300 Jutaan",
  "dp": "1 Juta All In"
}
```

### 3. Update Images
1. Place new images in `public/images/`
2. Update image references in JSON files:
   - `data/hero.json` - Hero background
   - `data/gallery.json` - Gallery images

### 4. Change Admin Password
**IMPORTANT**: Change default admin credentials!

Edit `public/js/admin-config.js`:
```javascript
const ADMIN_CREDENTIALS = {
  username: "your-new-username",
  password: "your-strong-password-here"
};
```

## 🔒 Security Configuration

### 1. Enable HTTPS (Automatic on Vercel/Netlify)
- Vercel/Netlify provide automatic SSL
- For traditional hosting, install SSL certificate

### 2. Admin Panel Security
- Change default credentials immediately
- Consider adding IP restriction for admin panel
- Regular backup of `data/` directory

### 3. Image Optimization
```bash
# Install image optimization tools
npm install -g sharp imagemin-cli

# Optimize all images
imagemin public/images/* --out-dir=public/images/optimized
```

## 📱 Mobile Optimization

### Test on Real Devices
1. **Google Mobile-Friendly Test**: [https://search.google.com/test/mobile-friendly](https://search.google.com/test/mobile-friendly)
2. **Lighthouse Audit**: Run in Chrome DevTools
3. **PageSpeed Insights**: [https://pagespeed.web.dev/](https://pagespeed.web.dev/)

### Mobile-Specific Checks
- Touch targets (buttons) ≥ 44x44px
- Font size ≥ 16px for readability
- No horizontal scrolling
- Fast loading on 3G

## 🔄 Continuous Deployment

### GitHub Actions (Optional)
Create `.github/workflows/deploy.yml`:
```yaml
name: Deploy to Vercel
on:
  push:
    branches: [main]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: amondnet/vercel-action@v20
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.VERCEL_ORG_ID }}
          vercel-project-id: ${{ secrets.VERCEL_PROJECT_ID }}
```

## 🐛 Troubleshooting

### Common Issues

#### 1. Images Not Loading
- Check file paths in JSON files
- Verify image files exist in `public/images/`
- Check browser console for 404 errors

#### 2. Admin Panel Not Working
- Clear browser cache
- Check JavaScript console for errors
- Verify admin credentials in `admin-config.js`

#### 3. Mobile Layout Issues
- Test on different screen sizes
- Check CSS media queries
- Verify viewport meta tag

#### 4. Slow Loading
- Optimize image sizes
- Enable compression on hosting
- Use browser caching

### Debugging Steps
1. Open browser Developer Tools (F12)
2. Check Console for errors
3. Check Network tab for failed requests
4. Check Application tab for storage issues

## 📈 Monitoring & Analytics

### Recommended Tools
1. **Google Analytics**: Track visitors and conversions
2. **Hotjar**: Heatmaps and user recordings
3. **Google Search Console**: SEO performance
4. **Uptime Robot**: Monitor website availability

### Setup Google Analytics
1. Create GA4 property
2. Add tracking code to all pages:
```html
<!-- In head section -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

## 🔄 Regular Maintenance

### Weekly Tasks
1. Backup `data/` directory
2. Check for broken links
3. Review Google Analytics
4. Test contact forms

### Monthly Tasks
1. Update promotional content
2. Add new testimonials
3. Refresh gallery images
4. Security audit

### Quarterly Tasks
1. Full performance audit
2. SEO optimization review
3. Mobile compatibility test
4. Browser compatibility test

## 📞 Support

### Technical Support
- **Deployment Issues**: Check hosting provider documentation
- **Code Issues**: Review browser console errors
- **Performance Issues**: Run Lighthouse audit

### Contact
For additional support, contact:
- **Email**: support@perumahansubsidi.com
- **WhatsApp**: +6281234567890

---

**Last Updated**: May 22, 2026  
**Version**: 1.0.0