# JaiDeeClear Quote Form

A clean, production-ready quote request form for UV protection film installation built with Next.js and Tailwind CSS.

## Features

- ✅ Simplified form with 4 essential fields (Name, Phone, Location, Measurement Date)
- ✅ Full form validation with error messages
- ✅ Responsive design
- ✅ Ready to deploy on Vercel
- ✅ Tailwind CSS styling
- ✅ Lucide React icons

## Project Structure

```
jaideeclear-quote-form/
├── app/
│   ├── page.js              # Main form component
│   ├── layout.js            # Root layout
│   └── globals.css          # Global styles
├── package.json             # Dependencies
├── tailwind.config.js       # Tailwind configuration
├── postcss.config.js        # PostCSS configuration
├── next.config.js           # Next.js configuration
├── .gitignore              # Git ignore rules
└── README.md               # This file
```

## Getting Started

### Prerequisites
- Node.js 16+ 
- npm or yarn

### Local Development

1. **Install dependencies**
   ```bash
   npm install
   ```

2. **Run development server**
   ```bash
   npm run dev
   ```

3. **Open in browser**
   ```
   http://localhost:3000
   ```

## Deployment on Vercel

### Option 1: Using Vercel CLI

1. **Install Vercel CLI**
   ```bash
   npm i -g vercel
   ```

2. **Deploy**
   ```bash
   vercel
   ```

### Option 2: Using GitHub (Recommended)

1. **Initialize Git repository**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   ```

2. **Push to GitHub**
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/jaideeclear-quote-form.git
   git branch -M main
   git push -u origin main
   ```

3. **Connect to Vercel**
   - Go to [vercel.com](https://vercel.com)
   - Sign in with GitHub
   - Click "New Project"
   - Select your repository
   - Click "Deploy"

## Form Fields

The form collects the following information:

1. **Full Name** - Customer's name (required)
2. **Phone Number** - Contact phone number (required, validates format)
3. **Installation Location** - Address where film will be installed (required)
4. **Preferred On-Site Measurement Date** - Date for measurement appointment (required, minimum today's date)

## Validation

- All fields are required
- Phone number validates for proper format
- Measurement date defaults to today's date minimum
- Real-time error clearing as user types

## Form Flow

1. User fills out the 4 required fields
2. Form validates on submit
3. Upon success, shows confirmation screen with contact information
4. User can submit another quote or view confirmation details

## Customization

### Change Company Details
Edit `app/page.js` and update:
- Phone number
- Email address
- Contact handle (WhatsApp, etc.)
- Company name/branding

### Modify Styling
- Global styles: `app/globals.css`
- Component styles: Tailwind classes in `app/page.js`
- Colors: Edit `tailwind.config.js`

## Environment Variables

No environment variables required for basic deployment. If you add a backend API:

1. Create `.env.local`
2. Add your API endpoint:
   ```
   NEXT_PUBLIC_API_URL=https://your-api.com
   ```

## Building for Production

```bash
npm run build
npm start
```

## Support

For issues or questions, contact JaiDeeClear at:
- 📞 +66 92-006-8100
- 💬 @jaideeclear
- 📧 jaideeclear@gmail.com

---

**Made with ❤️ for JaiDeeClear**
