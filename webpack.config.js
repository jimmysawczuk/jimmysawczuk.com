var webpack = require('webpack');
var ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
	entry: "./entry.js",
	output: {
		path: __dirname,
		filename: './build/bundle.js'
	},
	module: {
		loaders: [
			{
				test: /\.css$/,
				loader: "style!css"
			},
			{
				test: /\.less$/,
				loader: "style!css!less"
			},
			{ test: /\.svg(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: 'url?limit=65000&mimetype=image/svg+xml&name=./fonts/[name].[ext]' },
			{ test: /\.woff(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: 'url?limit=65000&mimetype=application/font-woff&name=./fonts/[name].[ext]' },
			{ test: /\.woff2(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: 'url?limit=65000&mimetype=application/font-woff2&name=./fonts/[name].[ext]' },
			{ test: /\.[ot]tf(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: 'url?limit=65000&mimetype=application/octet-stream&name=./fonts/[name].[ext]' },
			{ test: /\.eot(\?v=[0-9]\.[0-9]\.[0-9])?$/, loader: 'url?limit=65000&mimetype=application/vnd.ms-fontobject&name=./fonts/[name].[ext]' },
			{
                test: /\.css$/,
                loader: ExtractTextPlugin.extract("style-loader", "css-loader")
            },
            // Optionally extract less files
            // or any other compile-to-css language
            {
                test: /\.less$/,
                loader: ExtractTextPlugin.extract("style-loader", "css-loader!less-loader")
            }
		]
	},
	plugins: [
		new webpack.optimize.UglifyJsPlugin({
			compress: {
				warnings: false
			}
		}),

		new ExtractTextPlugin("build/[name].css", {
			allChunks: true
		}),
	]
};
