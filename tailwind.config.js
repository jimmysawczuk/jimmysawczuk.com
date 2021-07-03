module.exports = {
  mode: "jit",
  purge: ["./public/**/*.html"],
  darkMode: "media",
  theme: {
    fontFamily: {
      sans: [
        "-apple-system",
        "BlinkMacSystemFont",
        "Segoe UI",
        "Roboto",
        "Oxygen-Sans",
        "Ubuntu",
        "Cantarell",
        "Helvetica Neue",
        "sans-serif",
      ],

      title: [
        "Quicksand",
        "-apple-system",
        "BlinkMacSystemFont",
        "Segoe UI",
        "Roboto",
        "Oxygen-Sans",
        "Ubuntu",
        "Cantarell",
        "Helvetica Neue",
        "sans-serif",
      ],
    },
    extend: {
      screens: {
        print: { raw: "print" },
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
