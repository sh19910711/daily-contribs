const webpack = require('webpack');
module.exports = {
  entry: './main',
  output: { path: __dirname + '/../app/public/js', filename: 'bundle.js' },
  resolve: {
    root: [__dirname],
    alias: {
      'vue': 'vue/dist/vue.min.js',
      'vue-router': 'vue-router/dist/vue-router.min.js'
    },
  },
  module: {
    loaders: [
      { test: /\.vue$/, loader: 'vue' },
      { test: /\.js$/,  loader: 'babel', exclude: /node_modules/ },
    ]
  },
  babel: { presets: ['es2015'] },
  watchOptions: { poll: 1000 },
  plugins: [
    new webpack.ProvidePlugin({
      'fetch': 'imports?this=>global!exports?global.fetch!whatwg-fetch'
    })
  ]
};
