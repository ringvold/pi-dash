var path = require('path');
var webpack = require('webpack');
var merge = require('webpack-merge');
var HtmlWebpackPlugin = require('html-webpack-plugin');
var autoprefixer = require('autoprefixer');
var ExtractTextPlugin = require('extract-text-webpack-plugin');
var CopyWebpackPlugin = require('copy-webpack-plugin');
var entryPath = path.join(__dirname, 'src/static/index.js');
var outputPath = path.join(__dirname, 'dist');

console.log('WEBPACK GO!');

// determine build env
var TARGET_ENV =
  process.env.npm_lifecycle_event === 'build' ? 'production' : 'development';
var outputFilename =
  TARGET_ENV === 'production' ? '[name]-[hash].js' : '[name].js';

// common webpack config
var commonConfig = {
  output: {
    path: outputPath,
    filename: `static/js/${outputFilename}`
    // publicPath: '/'
  },

  resolve: {
    extensions: ['.js', '.elm']
  },

  module: {
    noParse: /\.elm$/,
    rules: [
      {
        test: /\.(eot|ttf|woff|woff2|svg)$/,
        use: 'file-loader'
      }
    ]
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: 'src/static/index.html',
      inject: 'body',
      filename: 'index.html'
    })
  ],
};

// additional webpack settings for local env (when invoked by 'npm start')
if (TARGET_ENV === 'development') {
  console.log('Serving locally...');

  module.exports = merge(commonConfig, {
    entry: ['webpack-dev-server/client?http://localhost:8080', entryPath],
    mode: 'development',
    devServer: {
      // serve index.html in place of 404 responses
      historyApiFallback: true,
      contentBase: './src',
      proxy: [
        {
          context: ['/weather', '/ruter'],
          target: 'http://localhost:8081'
        }
      ]
    },

    module: {
      rules: [
        {
          test: /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          use: 'elm-hot!elm-webpack?verbose=true&warn=true&debug=true'
        },
        {
          test: /\.(css|scss)$/,
          use: ExtractTextPlugin.extract({
            fallback: 'style-loader',
            use: ['css-loader', 'postcss-loader', 'sass-loader'],
          }),
        }
      ]
    }
  });
}

// additional webpack settings for prod env (when invoked via 'npm run build')
if (TARGET_ENV === 'production') {
  console.log('Building for prod...');

  module.exports = merge(commonConfig, {
    entry: entryPath,
    mode: 'production',
    module: {
      rules: [
        {
          test: /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          use: 'elm-webpack-loader'
        },
        {
          test: /\.(css|scss)$/,
          use: ExtractTextPlugin.extract({
            fallback: 'style-loader',
            use: ['css-loader', 'postcss-loader', 'sass-loader'],
          }),
        }
      ]
    },

    optimization: {
      minimize: false
    },

    plugins: [
      new CopyWebpackPlugin([
        {
          from: 'src/static/img/',
          to: 'static/img/'
        },
        {
          from: 'src/static/symbol/',
          to: 'static/symbol/'
        },
      ]),

      // extract CSS into a separate file
      new ExtractTextPlugin('static/css/[name]-[hash].css', {
        allChunks: true
      }),

    ]
  });
}
