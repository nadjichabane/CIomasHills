# Perumahan Subsidi Ciomas Bogor - Landing Page & Admin Panel

Modern premium landing page for subsidized housing ads in Ciomas, Bogor with clean luxury + conversion focused design.

## 🏠 Project Overview

**Target Audience:**
- Young couples
- New families
- Factory workers/employees
- First-time home buyers

**Primary Goal:**
- Increase WhatsApp leads
- Drive immediate site survey interest

## 🚀 Quick Deployment

### Prerequisites
- Node.js 16+ (for admin panel)
- Modern web browser
- Basic web hosting (Vercel, Netlify, GitHub Pages, etc.)

### Deployment Options

#### Option 1: Static Hosting (Recommended)
1. Clone the repository
2. Upload the entire `public/` folder to your hosting service
3. Configure the following:
   - Custom domain (optional)
   - SSL certificate (recommended)
   - Redirect rules (if needed)

#### Option 2: Vercel Deployment
```bash
# Install Vercel CLI
npm install -g vercel

# Deploy
vercel --prod
```

#### Option 3: Netlify Deployment
1. Connect your GitHub repository to Netlify
2. Set build command (if needed): `npm run build`
3. Set publish directory: `public`
4. Deploy

## 📁 Project Structure

```
subsidized-housing-project/
├── README.md                    # This file
├── DEPLOYMENT_GUIDE.md         # Detailed deployment instructions
├── package.json                # Dependencies and scripts
├── public/                     # Static files (HTML, CSS, JS, images)
│   ├── index.html             # Landing page
│   ├── admin.html             # Admin panel
│   ├── css/                   # Stylesheets
│   ├── js/                    # JavaScript files
│   └── images/                # All images and assets
├── data/                      # JSON data files for content
└── config/                    # Configuration files
```

## 🔧 Configuration

### 1. Update Contact Information
Edit `data/contact.json` to update:
- WhatsApp number
- Marketing office address
- Social media links
- Business hours

### 2. Update Property Images
Place new images in `public/images/` and update references in:
- `data/gallery.json`
- `data/hero.json`

### 3. Update Content
All content is stored in JSON files in the `data/` directory:
- `hero.json` - Hero section content
- `stats.json` - Statistics and social proof
- `advantages.json` - Key advantages
- `gallery.json` - Property gallery
- `specifications.json` - House specifications
- `location.json` - Location information
- `testimonials.json` - Customer testimonials
- `promo.json` - Promotional content
- `contact.json` - Contact information

## 📱 Admin Panel Usage

Access the admin panel at: `https://your-domain.com/admin.html`

### Admin Features:
1. **Real-time Content Editing** - Edit all text content
2. **Image Management** - Upload, crop, and replace images
3. **Gallery Management** - Reorder property photos
4. **Promotion Management** - Update promotional offers
5. **Contact Information** - Update contact details

### Admin Credentials (Default):
- **Username**: admin
- **Password**: housing2026

**IMPORTANT**: Change the default password after first login!

## 🛠️ Development

### Local Development
```bash
# Install dependencies
npm install

# Start local server
npm start

# Build for production
npm run build
```

### Customization
- **Colors**: Edit CSS variables in `public/css/variables.css`
- **Fonts**: Update font imports in `public/css/fonts.css`
- **Animations**: Modify animation settings in `public/js/animations.js`

## 🔒 Security Notes

1. **Change Default Credentials** - Update admin username/password immediately
2. **HTTPS Required** - Always use HTTPS in production
3. **Regular Backups** - Backup `data/` directory regularly
4. **Image Optimization** - Compress images before upload
5. **CORS Configuration** - Configure CORS for API calls if needed

## 📊 Performance Optimization

- Images are automatically optimized for web
- CSS and JS are minified in production
- Lazy loading for gallery images
- Caching headers configured
- SEO optimized meta tags

## 🤝 Support

For deployment assistance:
1. Check the `DEPLOYMENT_GUIDE.md` file
2. Review the troubleshooting section
3. Contact technical support if needed

## 📄 License

This project is proprietary and confidential. All rights reserved.

---

**Last Updated**: May 22, 2026
**Version**: 1.0.0


## 🚀 **Auto-Deployment with GitHub + Vercel**

### **Automatic Setup (Recommended)**
This project is pre-configured for **auto-deployment** to Vercel via GitHub Actions:

1. **Push to GitHub:**
   ```bash
   git init
   git add .
   git commit -m "Initial commit: CiomasHills"
   git remote add origin https://github.com/nadjichabane/CiomasHills.git
   git push -u origin main
   ```

2. **Import to Vercel:**
   - Go to [vercel.com/new](https://vercel.com/new)
   - Import `nadjichabane/CiomasHills`
   - Deploy with one click

3. **Auto-deploy on every push:**
   - Push to `main` → Auto-deploy to production
   - Create pull request → Preview deployment
   - All configured in `.github/workflows/`

### **GitHub Actions Workflows**
- **vercel-deploy.yml** - Auto-deploy to Vercel
- **code-quality.yml** - Code quality checks (ESLint, security, performance)

## 🔧 **One-Click Deployment Script**

Use the included deployment script:
```bash
# Make executable (first time)
chmod +x deploy.sh

# Run deployment script
./deploy.sh
```

The script will guide you through:
1. Tool checks
2. GitHub setup
3. Build process
4. Vercel deployment

## ⚡ **Performance Features**

### **Built-in Optimizations:**
- ✅ **Lighthouse CI** - Performance monitoring
- ✅ **Image Optimization** - Auto WebP conversion
- ✅ **Code Minification** - CSS/JS minification
- ✅ **Caching Headers** - Optimal cache control
- ✅ **Security Headers** - Modern security standards

### **Vercel-specific:**
- Edge network delivery (30+ locations)
- Automatic HTTPS
- DDoS protection
- Automatic scaling

## 📊 **Monitoring & Analytics**

### **Performance Dashboard:**
1. **Vercel Analytics** - Built-in performance metrics
2. **Lighthouse Scores** - Automated performance testing
3. **GitHub Actions** - Build and deployment logs

### **Custom Analytics:**
- Google Analytics (add ID to `.env`)
- Facebook Pixel (add ID to `.env`)
- Hotjar (add script to HTML)

## 🔐 **Security & Secrets**

### **Environment Variables:**
Create `.env` file from template:
```bash
cp .env.example .env
# Edit .env with your values
```

### **GitHub Secrets:**
Add to GitHub repo settings:
- `VERCEL_TOKEN`
- `VERCEL_ORG_ID`
- `VERCEL_PROJECT_ID`

## 🛠️ **Troubleshooting**

### **Common Issues & Solutions:**

1. **Build fails:**
   ```bash
   # Clear dependencies
   rm -rf node_modules package-lock.json
   npm install
   ```

2. **Deployment stuck:**
   - Check Vercel dashboard logs
   - Verify GitHub Actions secrets
   - Check Node.js version compatibility

3. **Admin panel not loading:**
   - Check browser console for errors
   - Verify data files exist in `data/` directory
   - Check CORS settings (if using different domains)

## 📞 **Support & Resources**

### **Quick Links:**
- **Live Demo:** `https://ciomashills.vercel.app`
- **Admin Panel:** `https://ciomashills.vercel.app/admin`
- **GitHub Repo:** `https://github.com/nadjichabane/CiomasHills`
- **Vercel Docs:** `https://vercel.com/docs`

### **Documentation:**
- [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) - Full deployment guide
- [GITHUB_DEPLOY.md](GITHUB_DEPLOY.md) - GitHub-specific instructions
- [vercel-instructions.md](vercel-instructions.md) - Vercel setup guide

## 🎯 **Success Metrics**

### **After Deployment:**
- [ ] Site loads in < 3 seconds
- [ ] Admin panel accessible and functional
- [ ] Mobile responsive on all devices
- [ ] WhatsApp leads form working
- [ ] Analytics tracking enabled
- [ ] SEO meta tags properly set

### **Performance Targets:**
- Lighthouse Performance: > 90
- Lighthouse SEO: > 95  
- First Contentful Paint: < 2s
- Largest Contentful Paint: < 2.5s
- Cumulative Layout Shift: < 0.1

---

## 📝 **License & Credits**

**Proprietary** - For internal use by J&T CARGO Indonesia marketing team.

**Developed by:** Marketing Department - J&T CARGO Indonesia  
**Contact:** marketing@jtcargo.id  
**Version:** 1.0.0  
**Last Updated:** May 22, 2026

---

**🚀 Ready for Production Deployment!**