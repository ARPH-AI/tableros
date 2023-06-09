const colors = require('tailwindcss/colors')

module.exports = {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}', './node_modules/vue-tailwind-datepicker/**/*.js'],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        'vtd-primary': colors.sky, // Light mode Datepicker color
        'vtd-secondary': colors.gray, // Dark mode Datepicker color
      },
    },
    colors: {
      color_0_dark: '#f7931e',
      color_0: '#ae5d00',
      color_1: '#007f86',
      color_1_dark: '#00bfcc',
      color_2: '#ed1c24',
      dark_base: '#1e1e2f',
      light_base: '#E5E7EB',
      light_contrast: '#1e1e2f',
      dark_contrast: '#F3F4F6',
      dark_smooth: '#27293d',
      light_smooth: '#FFFBEB',
      coroplethic_0: '#F3F4F6',
      coroplethic_1: '#FFFFCC',
      coroplethic_2: '#FFEDA0',
      coroplethic_3: '#FED976',
      coroplethic_4: '#FEB24C',
      coroplethic_5: '#FD8D3C',
      coroplethic_6: '#FC4E2A',
      coroplethic_7: '#E31A1C',
      coroplethic_8: '#B10026',
      ...colors,
    },
  },
  plugins: [require('tailwind-scrollbar'), require('@tailwindcss/forms'), require('@tailwindcss/line-clamp')],
  variants: {
    scrollbar: ['dark'],
  },
  safelist: [
    'bg-coroplethic_0',
    'bg-coroplethic_1',
    'bg-coroplethic_2',
    'bg-coroplethic_3',
    'bg-coroplethic_4',
    'bg-coroplethic_5',
    'bg-coroplethic_6',
    'bg-coroplethic_7',
    'text-color_0_dark',
    'text-color_1_dark',
    'dark:hover:text-color_0_dark',
    'dark:hover:text-color_1_dark',
  ],
}
