const path = require("path")
const MiniCssExtractPlugin = require("mini-css-extract-plugin")
const TerserJSPlugin = require("terser-webpack-plugin")
const CssMinimizerPlugin = require('css-minimizer-webpack-plugin');

const config = {
  plugins: [new MiniCssExtractPlugin()],
  optimization: {
    minimizer: [new TerserJSPlugin({}), new CssMinimizerPlugin({})],
  },
  entry: {
    main: "./src/main.js",
    resume: "./src/resume.js",
  },
  output: {
    path: path.resolve(__dirname, "public/dist"),
    filename: "[name].js",
    publicPath: "",
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /(node_modules)/,
        use: [
          {
            loader: "babel-loader",
            options: {
              presets: ["@babel/preset-env"],
              plugins: ["@babel/plugin-proposal-object-rest-spread"],
            },
          },
        ],
      },
      {
        test: /\.scss$/,
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
          },
          { loader: "css-loader" },
          { loader: "postcss-loader" },
          { loader: "sass-loader" },
        ],
      },
      {
        test: /\.(svg|woff|woff2|eot|ttf)$/,
        use: [
          {
            loader: "file-loader",
            options: {
              name: "type/[name].[sha256:contenthash:hex:8].[ext]",
            },
          },
        ],
      },
    ],
  },
}

module.exports = (env, argv) => {
  if (argv.mode === "development") {
    delete config.optimization

    config.devtool = "eval"
  }

  return config
}
