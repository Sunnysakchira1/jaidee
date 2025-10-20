#!/bin/bash

# JaiDeeClear Quote Form - Project Setup Script
# This script creates all necessary files for GitHub & Vercel deployment

echo "🚀 Creating JaiDeeClear Quote Form Project..."

# Create directory structure
mkdir -p app

echo "✅ Creating configuration files..."

# package.json
cat > package.json << 'EOF'
{
  "name": "jaideeclear-quote-form",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "next": "^14.0.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "lucide-react": "^0.263.1"
  },
  "devDependencies": {
    "autoprefixer": "^10.4.16",
    "postcss": "^8.4.31",
    "tailwindcss": "^3.3.5"
  }
}
EOF

# tailwind.config.js
cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOF

# postcss.config.js
cat > postcss.config.js << 'EOF'
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

# next.config.js
cat > next.config.js << 'EOF'
/** @type {import('next').NextConfig} */
const nextConfig = {}

module.exports = nextConfig
EOF

# vercel.json
cat > vercel.json << 'EOF'
{
  "buildCommand": "next build",
  "devCommand": "next dev",
  "installCommand": "npm install",
  "framework": "nextjs",
  "env": {
    "NEXT_PUBLIC_APP_NAME": "JaiDeeClear Quote Form"
  }
}
EOF

# .gitignore
cat > .gitignore << 'EOF'
# dependencies
/node_modules
/.pnp
.pnp.js

# testing
/coverage

# next.js
/.next/
/out/

# production
/build

# misc
.DS_Store
*.pem

# debug
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# local env files
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# IDE
.vscode
.idea
*.swp
*.swo
EOF

# .env.example
cat > .env.example << 'EOF'
# Copy this file to .env.local and fill in your values

# API Configuration (optional - if you have a backend)
# NEXT_PUBLIC_API_URL=https://your-api-endpoint.com

# Email Configuration (optional - for sending form data)
# NEXT_PUBLIC_EMAIL_FROM=jaideeclear@gmail.com
# NEXT_PUBLIC_EMAIL_TO=jaideeclear@gmail.com
EOF

echo "✅ Creating app files..."

# app/layout.js
cat > app/layout.js << 'EOF'
import './globals.css'

export const metadata = {
  title: 'JaiDeeClear - Quote Request',
  description: 'Request a quote for UV protection film installation',
}

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
EOF

# app/globals.css
cat > app/globals.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
}

body {
  background-color: #ffffff;
  color: #1f2937;
}
EOF

# app/page.js
cat > app/page.js << 'EOF'
'use client'

import { useState } from 'react'
import { Check, Phone, Mail, MessageCircle, Shield, Sparkles } from 'lucide-react'

export default function QuoteForm() {
  const [step, setStep] = useState(1)
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [formData, setFormData] = useState({
    name: '',
    phone: '',
    location: '',
    measurementDate: ''
  })
  const [errors, setErrors] = useState({})

  const validateForm = () => {
    const newErrors = {}

    if (!formData.name.trim()) {
      newErrors.name = 'Full name is required'
    }

    if (!formData.phone.trim()) {
      newErrors.phone = 'Phone number is required'
    } else if (!/^[\d\s\-\+()]+$/.test(formData.phone)) {
      newErrors.phone = 'Please enter a valid phone number'
    }

    if (!formData.location.trim()) {
      newErrors.location = 'Location is required'
    }

    if (!formData.measurementDate) {
      newErrors.measurementDate = 'Measurement date is required'
    }

    setErrors(newErrors)
    return Object.keys(newErrors).length === 0
  }

  const handleSubmit = async (e) => {
    e.preventDefault()

    if (!validateForm()) {
      return
    }

    setIsSubmitting(true)

    try {
      // Simulate API call
      await new Promise(resolve => setTimeout(resolve, 1500))
      
      // In production, you would send data to your backend
      console.log('Form submitted:', formData)
      
      setStep(2)
    } catch (error) {
      console.error('Error submitting form:', error)
    } finally {
      setIsSubmitting(false)
    }
  }

  const handleReset = () => {
    setStep(1)
    setFormData({
      name: '',
      phone: '',
      location: '',
      measurementDate: ''
    })
    setErrors({})
  }

  return (
    <div className="min-h-screen bg-white">
      {/* Header */}
      <header className="border-b border-gray-100 sticky top-0 bg-white/80 backdrop-blur-lg z-50">
        <div className="max-w-2xl mx-auto px-6 py-4 flex justify-between items-center">
          <div className="flex items-center space-x-3">
            <svg width="50" height="34" viewBox="0 0 240 120" className="flex-shrink-0">
              <path d="M 20 40 Q 35 20, 50 40 Q 65 60, 80 40 L 80 80 Q 65 100, 50 80 Q 35 60, 20 80 Z" fill="#f0f0f0"/>
              <path d="M 70 35 Q 85 15, 100 35 Q 115 55, 130 35 L 130 85 Q 115 105, 100 85 Q 85 65, 70 85 Z" fill="#d1d5db"/>
              <path d="M 120 30 Q 135 10, 150 30 Q 165 50, 180 30 L 180 90 Q 165 110, 150 90 Q 135 70, 120 90 Z" fill="#9ca3af"/>
              <path d="M 170 25 Q 185 5, 200 25 Q 215 45, 230 25 L 230 95 Q 215 115, 200 95 Q 185 75, 170 95 Z" fill="#FFA500"/>
            </svg>
            <div>
              <div className="text-lg font-bold text-gray-900">
                JAIDEE<span className="bg-black text-white px-1">CLEAR</span>
              </div>
              <div className="text-xs text-gray-700 font-medium">UV PROTECTION FILM</div>
            </div>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="max-w-2xl mx-auto px-6 py-12">
        {step === 1 && (
          <div className="space-y-8">
            <div>
              <h1 className="text-4xl font-light text-gray-900 mb-2">Request a Quote</h1>
              <p className="text-gray-600">Schedule an on-site measurement for your UV protection film installation</p>
            </div>

            <form onSubmit={handleSubmit} className="space-y-6">
              {/* Full Name */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Full Name <span className="text-red-500">*</span>
                </label>
                <input
                  type="text"
                  value={formData.name}
                  onChange={(e) => {
                    setFormData({ ...formData, name: e.target.value })
                    if (errors.name) setErrors({ ...errors, name: '' })
                  }}
                  placeholder="e.g., Somchai Saengchai"
                  className={`w-full px-4 py-3 border-2 rounded-xl focus:outline-none transition-colors ${
                    errors.name
                      ? 'border-red-500 focus:border-red-500'
                      : 'border-gray-200 focus:border-orange-500'
                  }`}
                />
                {errors.name && <p className="text-red-500 text-sm mt-1">{errors.name}</p>}
              </div>

              {/* Phone Number */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Phone Number <span className="text-red-500">*</span>
                </label>
                <input
                  type="text"
                  value={formData.phone}
                  onChange={(e) => {
                    setFormData({ ...formData, phone: e.target.value })
                    if (errors.phone) setErrors({ ...errors, phone: '' })
                  }}
                  placeholder="+66 92-006-8100"
                  className={`w-full px-4 py-3 border-2 rounded-xl focus:outline-none transition-colors ${
                    errors.phone
                      ? 'border-red-500 focus:border-red-500'
                      : 'border-gray-200 focus:border-orange-500'
                  }`}
                />
                {errors.phone && <p className="text-red-500 text-sm mt-1">{errors.phone}</p>}
              </div>

              {/* Location */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Installation Location <span className="text-red-500">*</span>
                </label>
                <input
                  type="text"
                  value={formData.location}
                  onChange={(e) => {
                    setFormData({ ...formData, location: e.target.value })
                    if (errors.location) setErrors({ ...errors, location: '' })
                  }}
                  placeholder="e.g., Sukhumvit Soi 21, Bangkok"
                  className={`w-full px-4 py-3 border-2 rounded-xl focus:outline-none transition-colors ${
                    errors.location
                      ? 'border-red-500 focus:border-red-500'
                      : 'border-gray-200 focus:border-orange-500'
                  }`}
                />
                {errors.location && <p className="text-red-500 text-sm mt-1">{errors.location}</p>}
              </div>

              {/* Measurement Date */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">
                  Preferred On-Site Measurement Date <span className="text-red-500">*</span>
                </label>
                <input
                  type="date"
                  value={formData.measurementDate}
                  onChange={(e) => {
                    setFormData({ ...formData, measurementDate: e.target.value })
                    if (errors.measurementDate) setErrors({ ...errors, measurementDate: '' })
                  }}
                  min={new Date().toISOString().split('T')[0]}
                  className={`w-full px-4 py-3 border-2 rounded-xl focus:outline-none transition-colors ${
                    errors.measurementDate
                      ? 'border-red-500 focus:border-red-500'
                      : 'border-gray-200 focus:border-orange-500'
                  }`}
                />
                {errors.measurementDate && <p className="text-red-500 text-sm mt-1">{errors.measurementDate}</p>}
              </div>

              {/* Submit Button */}
              <button
                type="submit"
                disabled={isSubmitting}
                className="w-full bg-orange-500 text-white py-4 rounded-xl font-semibold text-lg hover:bg-orange-600 transition-colors disabled:bg-gray-400 disabled:cursor-not-allowed"
              >
                {isSubmitting ? 'Submitting...' : 'Request Quote'}
              </button>
            </form>

            <p className="text-center text-xs text-gray-500 mt-8">
              We'll contact you shortly to confirm your measurement appointment
            </p>
          </div>
        )}

        {step === 2 && (
          <div className="text-center py-12">
            <div className="w-20 h-20 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-6">
              <Check className="w-10 h-10 text-green-600" />
            </div>
            <h2 className="text-3xl font-light text-gray-900 mb-4">Quote Request Received!</h2>
            <p className="text-gray-600 mb-8 max-w-md mx-auto">
              Thank you for choosing JaiDeeClear. Our team will contact you shortly to confirm your on-site measurement appointment.
            </p>

            <div className="space-y-3 max-w-md mx-auto mb-8">
              <div className="bg-white border-2 border-gray-200 rounded-xl p-4">
                <div className="flex items-center space-x-3">
                  <Phone className="w-5 h-5 text-orange-500" />
                  <span className="font-medium">+66 92-006-8100</span>
                </div>
              </div>
              <div className="bg-white border-2 border-gray-200 rounded-xl p-4">
                <div className="flex items-center space-x-3">
                  <MessageCircle className="w-5 h-5 text-orange-500" />
                  <span className="font-medium">@jaideeclear</span>
                </div>
              </div>
              <div className="bg-white border-2 border-gray-200 rounded-xl p-4">
                <div className="flex items-center space-x-3">
                  <Mail className="w-5 h-5 text-orange-500" />
                  <span className="font-medium">jaideeclear@gmail.com</span>
                </div>
              </div>
            </div>

            <button
              onClick={handleReset}
              className="text-orange-500 hover:underline font-medium"
            >
              Submit Another Quote
            </button>
          </div>
        )}
      </main>

      {/* Footer */}
      <footer className="border-t border-gray-100 mt-20">
        <div className="max-w-2xl mx-auto px-6 py-12">
          <div className="flex flex-wrap justify-center gap-6 text-sm text-gray-600 mb-8">
            <div className="flex items-center space-x-2">
              <Shield className="w-4 h-4" />
              <span>ISO 9001 Certified</span>
            </div>
            <div className="flex items-center space-x-2">
              <Sparkles className="w-4 h-4" />
              <span>IWFA Member</span>
            </div>
          </div>
          <p className="text-center text-xs text-gray-400">
            © 2025 JaiDeeClear. On-site service throughout Bangkok.
          </p>
        </div>
      </footer>
    </div>
  )
}
EOF

echo "✅ Creating documentation files..."

# README.md
cat > README.md << 'EOF'
# JaiDeeClear Quote Form

A clean, production-ready quote request form for UV protection film installation built with Next.js and Tailwind CSS.

## Features

- ✅ Simplified form with 4 essential fields (Name, Phone, Location, Measurement Date)
- ✅ Full form validation with error messages
- ✅ Responsive design
- ✅ Ready to deploy on Vercel
- ✅ Tailwind CSS styling
- ✅ Lucide React icons

## Quick Start

### Local Development

```bash
npm install
npm run dev
# Open http://localhost:3000
```

### Deploy to Vercel

1. Push to GitHub
2. Connect GitHub repo to Vercel
3. Auto-deploys on every push!

## Form Fields

- Full Name
- Phone Number
- Installation Location
- Preferred On-Site Measurement Date

## Customization

Edit `app/page.js` to update:
- Company contact details
- Form fields
- Colors and styling

## Documentation

See `DEPLOYMENT.md` for detailed deployment instructions.
EOF

# DEPLOYMENT.md
cat > DEPLOYMENT.md << 'EOF'
# 🚀 Deployment Guide

## Step 1: Setup GitHub Repository

### Create New Repository

1. Go to https://github.com/new
2. Name it: `jaideeclear-quote-form`
3. Select "Public" or "Private"
4. Click "Create repository"

### Push Code to GitHub

```bash
git init
git add .
git commit -m "Initial commit: JaiDeeClear quote form"
git remote add origin https://github.com/YOUR_USERNAME/jaideeclear-quote-form.git
git branch -M main
git push -u origin main
```

## Step 2: Deploy to Vercel

### Option A: GitHub Integration (Recommended)

1. Go to https://vercel.com
2. Sign in with GitHub
3. Click "New Project"
4. Select your `jaideeclear-quote-form` repository
5. Click "Deploy"
6. Done! 🎉

### Option B: Vercel CLI

```bash
npm i -g vercel
vercel
```

## Step 3: Access Your Deployment

Your app will be live at:
```
https://jaideeclear-quote-form.vercel.app
```

## Adding Custom Domain

1. Go to Vercel Dashboard
2. Select your project
3. Settings → Domains
4. Add your custom domain
5. Follow DNS configuration

## Make Updates

Any push to main branch auto-deploys:

```bash
git add .
git commit -m "Update form"
git push origin main
```

Vercel automatically redeploys!

## Environment Variables

Add to Vercel:
1. Project Settings → Environment Variables
2. Add your variables
3. Redeploy

## Support

Contact: jaideeclear@gmail.com
EOF

echo ""
echo "✅ All files created successfully!"
echo ""
echo "📁 Project structure:"
echo "  jaideeclear-quote-form/"
echo "  ├── app/"
echo "  │   ├── page.js"
echo "  │   ├── layout.js"
echo "  │   └── globals.css"
echo "  ├── package.json"
echo "  ├── tailwind.config.js"
echo "  ├── postcss.config.js"
echo "  ├── next.config.js"
echo "  ├── vercel.json"
echo "  ├── .gitignore"
echo "  ├── .env.example"
echo "  ├── README.md"
echo "  └── DEPLOYMENT.md"
echo ""
echo "🚀 Next steps:"
echo "  1. npm install"
echo "  2. npm run dev"
echo "  3. git init && git add . && git commit -m 'Initial commit'"
echo "  4. Push to GitHub"
echo "  5. Deploy on Vercel"
echo ""
EOF
chmod +x setup-project.sh
cat setup-project.sh
