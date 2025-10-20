# Quick Setup & Deployment Guide

## 🚀 Deploy to Vercel in 3 Minutes

### Step 1: Prepare Your Project

```bash
# Navigate to your project folder
cd jaideeclear-quote-form

# Install dependencies
npm install

# Test locally
npm run dev
# Visit http://localhost:3000
```

### Step 2: Push to GitHub

```bash
# Initialize git
git init
git add .
git commit -m "Initial commit: JaiDeeClear quote form"

# Create repo on GitHub and push
git remote add origin https://github.com/YOUR_USERNAME/jaideeclear-quote-form.git
git branch -M main
git push -u origin main
```

### Step 3: Deploy on Vercel

**Option A: Automatic (Recommended)**
1. Go to https://vercel.com
2. Click "New Project"
3. Select your GitHub repo
4. Click "Deploy"
5. Done! ✅

**Option B: Using Vercel CLI**
```bash
npm i -g vercel
vercel
# Follow the prompts
```

## 📝 After Deployment

### Your URL will be:
```
https://jaideeclear-quote-form.vercel.app
```

### You can also add a custom domain:
1. Go to Vercel Dashboard
2. Project Settings → Domains
3. Add your custom domain
4. Follow DNS setup instructions

## 🔧 Make Changes

After deployment, any push to `main` branch will auto-deploy:

```bash
# Make changes locally
nano app/page.js

# Commit and push
git add .
git commit -m "Update form fields"
git push origin main

# Vercel automatically deploys!
```

## 📞 Customize Contact Info

Edit `app/page.js` and search for these sections:

```javascript
// Update phone number
<span className="font-medium">+66 92-006-8100</span>

// Update contact handle
<span className="font-medium">@jaideeclear</span>

// Update email
<span className="font-medium">jaideeclear@gmail.com</span>
```

## ✅ Form Validation

The form validates:
- ✓ Name is not empty
- ✓ Phone number format is valid
- ✓ Location is not empty
- ✓ Measurement date is selected and not in the past

## 🎨 Customize Styling

### Change Colors
Edit `app/page.js` and replace:
- `orange-500` → your primary color
- `gray-200` → your secondary color

Example:
```javascript
// Change from orange to blue
className="bg-orange-500" // Change to "bg-blue-500"
```

### Tailwind Color Options:
- red, yellow, green, blue, purple, pink, indigo, cyan, etc.

## 📊 View Form Submissions

Currently, form data is logged to the browser console. To save submissions:

### Option 1: Google Sheets
Use services like FormSubmit or Getform

### Option 2: Email Notifications
Add email service like SendGrid or Mailgun

### Option 3: Database
Connect to Firebase, MongoDB, or Supabase

## 🆘 Troubleshooting

### "npm install" fails
```bash
# Clear npm cache
npm cache clean --force
npm install
```

### Port 3000 already in use
```bash
# Use different port
npm run dev -- -p 3001
```

### Vercel deployment fails
```bash
# Check for errors
vercel logs
# Review build logs in Vercel Dashboard
```

## 📚 Resources

- Next.js Docs: https://nextjs.org/docs
- Vercel Docs: https://vercel.com/docs
- Tailwind CSS: https://tailwindcss.com/docs
- Lucide Icons: https://lucide.dev

---

**Need help? Contact JaiDeeClear at jaideeclear@gmail.com**
