/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        tomato: {
          red: '#FF6347',
          DEFAULT: '#FF6347',
        },
        sprout: {
          green: '#4CAF50',
          DEFAULT: '#4CAF50',
        },
        paper: {
          bg: '#FEFBF5',
          DEFAULT: '#FEFBF5',
        },
      },
      fontFamily: {
        rounded: ['ui-rounded', 'Hiragino Maru Gothic ProN', 'Quicksand', 'Comfortaa', 'Manjari', 'Arial Rounded MT Bold', 'Calibri', 'source-sans-pro', 'sans-serif'],
      },
      borderRadius: {
        'xl': '1rem',
        '2xl': '1.5rem',
        '3xl': '2rem',
      },
    },
  },
  plugins: [],
}
