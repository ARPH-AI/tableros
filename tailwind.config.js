const colors = require('tailwindcss/colors')

module.exports = {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  darkMode: 'class',
  theme: {
    colors: {
      primary: '#ffff',
      secondary: '#00becb',
      third: '#ed1c24',
      dark_base: '#1e1e2f',
      light_base: colors.gray,
      light_contrast: '#1e1e2f',
      dark_contrast: '#F3F4F6',
      dark_smooth: '#27293d',
      light_smooth: colors.neutral,
      coroplethic_0: '#FFFFCC',
      coroplethic_1: '#FFEDA0',
      coroplethic_2: '#FED976',
      coroplethic_3: '#FEB24C',
      coroplethic_4: '#FD8D3C',
      coroplethic_5: '#FC4E2A',
      coroplethic_6: '#E31A1C',
      coroplethic_7: '#B10026',
      ...colors,
    },
  },
  plugins: [require('tailwind-scrollbar')],
  variants: {
    scrollbar: ['dark'],
  },
}
