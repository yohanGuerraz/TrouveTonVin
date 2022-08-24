const HtmlWebPackPlugin = require('html-webpack-plugin')
const path = require('path')

module.exports = {
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: ['babel-loader']
      }, {
        test: /\.html$/,
        use: ['html-loader']
      }, {
        test: /\.css$/,
        use:['style-loader','css-loader']
      }, {
        test: /\.(png|svg|jpg|jpeg|gif)$/,
        use: ['file-loader']
      }, {
        test: /\.(woff(2)?|ttf|eot)(\?v=\d+\.\d+\.\d+)?$/,
        use: ['file-loader']
      }
    ]
  },
  plugins: [
    new HtmlWebPackPlugin({
      template: './public/index.html',
      filename: './index.html'
    })
  ], 
  devServer: {
    port: 8080,
    historyApiFallback: {
      index: `index.html`
    }
  }, 
  output: {
    publicPath: `/`
  }, 
  resolve: {
    alias: {
      components: path.resolve(__dirname, 'src/components/shop'),
      pages: path.resolve(__dirname, 'src/components/pages/'),
      css: path.resolve(__dirname, 'src/css/'),
      contexts: path.resolve(__dirname, 'src/components/pages/contexts/'),
      utils: path.resolve(__dirname, 'src/components/pages/utils/'),
      img: path.resolve(__dirname, 'src/asset/image/'),
      js: path.resolve(__dirname, 'src/js/')
    }
  }
}