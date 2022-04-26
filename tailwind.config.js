const colors = require('tailwindcss/colors')

module.exports = {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  darkMode: 'class',
  theme: {
    colors: {
      primary: '#ed1c24',
      secondary: '#00becb',
      third: '#f7931e',
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
