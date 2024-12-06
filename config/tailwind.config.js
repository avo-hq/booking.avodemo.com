const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
      colors: {
        "pastel-green": {
          50: "#f2fdf0",
          100: "#e0fbdd",
          200: "#c1f5bd",
          300: "#74e66c",
          400: "#59d850",
          500: "#31bf28",
          600: "#239e1b",
          700: "#1e7c19",
          800: "#1c6219",
          900: "#185116",
          950: "#082c07",
        },
        azure: {
          50: "#eff7ff",
          100: "#daedff",
          200: "#bee0ff",
          300: "#91cdff",
          400: "#5db0fd",
          500: "#388ef9",
          600: "#2b76ef",
          700: "#1a5adb",
          800: "#1c49b1",
          900: "#1c418c",
          950: "#162855",
        },
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
  ],
};
