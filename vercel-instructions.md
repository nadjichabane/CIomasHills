# Vercel Deployment Guide for CiomasHills

## 📋 **Prerequisites**

### 1. **Vercel Account**
- Sign up at [vercel.com](https://vercel.com) (free tier available)
- Connect your GitHub account during signup

### 2. **GitHub Repository**
- Repository URL: `https://github.com/nadjichabane/CiomasHills`
- Make sure you have push access

### 3. **Local Environment**
- Node.js 18+ installed
- Git installed
- Terminal/Command Prompt access

## 🚀 **Quick Deployment (5 Minutes)**

### **Option A: Automatic via GitHub Integration**
1. **Import to Vercel:**
   - Go to [vercel.com/new](https://vercel.com/new)
   - Click "Import Git Repository"
   - Select `nadjichabane/CiomasHills`
   - Click "Import"

2. **Configure Project:**
   - **Project Name:** `ciomashills` (or your preferred name)
   - **Framework Preset:** `Static`
   - **Root Directory:** `public`
   - **Build Command:** `npm run build`
   - **Output Directory:** `public`
   - Click "Deploy"

3. **Get Your URL:**
   - Deployment will start automatically
   - Your site will be live at: `https://ciomashills.vercel.app`
   - Custom domain can be added later

### **Option B: Manual Deployment via Vercel CLI**
1. **Install Vercel CLI:**
   ```bash
   npm install -g vercel
   ```

2. **Login to Vercel:**
   ```bash
   vercel login
   ```

3. **Deploy:**
   ```bash
   cd /path/to/CiomasHills
   vercel --prod
   ```

## ⚙️ **Advanced Configuration**

### **GitHub Actions Secrets**
For automatic deployments on push:

1. **Get Vercel Tokens:**
   - Go to [vercel.com/account/tokens](https://vercel.com/account/tokens)
   - Create new token with name "GitHub Actions"

2. **Get Organization & Project IDs:**
   - Go to your project in Vercel
   - Click "Settings" → "General"
   - Find "PROJECT ID" and "ORGANIZATION ID"

3. **Add to GitHub Secrets:**
   - Go to your GitHub repo: `https://github.com/nadjichabane/CiomasHills/settings/secrets/actions`
   - Add these secrets:
     - `VERCEL_TOKEN` = Your Vercel token
     - `VERCEL_ORG_ID` = Your organization ID
     - `VERCEL_PROJECT_ID` = Your project ID

### **Custom Domain Setup**
1. **In Vercel Dashboard:**
   - Go to project → "Settings" → "Domains"
   - Add your custom domain (e.g., `ciomashills.com`)

2. **Configure DNS:**
   - Add CNAME record pointing to: `cname.vercel-dns.com`
   - Or use A records with Vercel IP addresses

## 🔧 **Environment Variables**

Create `.env` file in project root:
```env
# Vercel Deployment
VERCEL_ORG_ID=team_xxxxxxxxxxxxxx
VERCEL_PROJECT_ID=prj_xxxxxxxxxxxxxxxxxxxx

# Site Configuration
SITE_URL=https://ciomashills.vercel.app
CONTACT_PHONE=+6281234567890
CONTACT_EMAIL=marketing@ciomashills.com

# Analytics (Optional)
GOOGLE_ANALYTICS_ID=UA-XXXXXXXXX-X
FACEBOOK_PIXEL_ID=XXXXXXXXXXXXXXX
```

## 📊 **Performance Optimization**

### **Vercel-specific Optimizations:**
1. **Edge Network:** Content served from 30+ locations globally
2. **Automatic HTTPS:** SSL certificates provided automatically
3. **Automatic Scaling:** Handles traffic spikes automatically
4. **Image Optimization:** Automatic image compression and WebP conversion

### **Build Settings:**
```json
{
  "builds": [
    {
      "src": "public/**",
      "use": "@vercel/static"
    }
  ],
  "routes": [
    {
      "src": "/",
      "dest": "/public/index.html"
    },
    {
      "src": "/admin",
      "dest": "/public/admin.html"
    }
  ]
}
```

## 🛠️ **Troubleshooting**

### **Common Issues:**

1. **Build Fails:**
   ```bash
   # Check Node.js version
   node --version  # Should be 18+
   
   # Clear npm cache
   npm cache clean --force
   
   # Reinstall dependencies
   rm -rf node_modules package-lock.json
   npm install
   ```

2. **404 Errors:**
   - Check `vercel.json` routes configuration
   - Ensure files exist in `public/` directory
   - Check case sensitivity in file paths

3. **Deployment Stuck:**
   - Check Vercel dashboard for logs
   - Verify GitHub Actions workflow status
   - Check repository secrets configuration

### **Performance Issues:**
1. **Enable Analytics:**
   - Vercel Analytics provides real-time performance data
   - Go to project → "Analytics" tab

2. **Optimize Images:**
   - Use Vercel's Image Optimization API
   - Example: `https://ciomashills.vercel.app/_vercel/image?url=/images/hero.jpg&w=1200&q=75`

## 📈 **Monitoring & Analytics**

### **Built-in Vercel Tools:**
1. **Analytics:** Real-time visitor tracking
2. **Logs:** Deployment and runtime logs
3. **Web Vitals:** Core Web Vitals monitoring
4. **Speed Insights:** Performance scoring

### **Third-party Integrations:**
1. **Google Analytics:** Add tracking ID to `.env`
2. **Hotjar:** Add script to `public/index.html`
3. **Facebook Pixel:** Add pixel ID to `.env`

## 🔄 **Continuous Deployment**

### **Auto-deploy on Push:**
- Push to `main` branch → Auto-deploy to production
- Push to other branches → Preview deployment
- Pull requests → Preview deployment with unique URL

### **Manual Deployments:**
```bash
# Deploy to production
vercel --prod

# Create preview deployment
vercel

# List deployments
vercel list
```

## 📞 **Support**

### **Vercel Support:**
- **Documentation:** [vercel.com/docs](https://vercel.com/docs)
- **Community:** [vercel.com/community](https://vercel.com/community)
- **Status:** [vercel-status.com](https://vercel-status.com)

### **Project Issues:**
- **GitHub Issues:** [github.com/nadjichabane/CiomasHills/issues](https://github.com/nadjichabane/CiomasHills/issues)
- **Email:** marketing@ciomashills.com

---

## 🎉 **Success Checklist**

- [ ] Vercel account created and linked to GitHub
- [ ] Repository imported to Vercel
- [ ] First deployment successful
- [ ] Custom domain configured (optional)
- [ ] Environment variables set
- [ ] Analytics configured (optional)
- [ ] Team members invited (optional)

**Your site is now live!** 🚀
URL: `https://ciomashills.vercel.app`