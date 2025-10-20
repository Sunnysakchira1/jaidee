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
