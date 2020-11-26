const autoprefixer = require("autoprefixer")
const purgecss = require("@fullhuman/postcss-purgecss")

module.exports = {
  plugins: [
    autoprefixer,
    purgecss({
      content: ["./tmpl/*.tmpl"],
      safelist: ["svg-inline--fa"],
    }),
  ],
}
