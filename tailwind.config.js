const colors = require('tailwindcss/colors')

module.exports = {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  darkMode: 'class',
  theme: {
    colors: {
      primary: '#f7931e',
      secondary: '#00becb',
      third: '#ed1c24',
      dark_base: '#1e1e2f',
      light_base: colors.gray,
      light_contrast: '#1e1e2f',
      dark_contrast: '#F3F4F6',
      dark_smooth: '#27293d',
      light_smooth: colors.neutral,
    },
  },
  plugins: [require('tailwind-scrollbar')],
  variants: {
    scrollbar: ['dark'],
  },
}
