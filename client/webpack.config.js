module.exports = {
  entry: './main',
  output: { path: __dirname + '/../app/public/js', filename: 'bundle.js' },
  module: {
    loaders: [
      { test: /\.js$/,  loader: 'babel', exclude: /node_modules/ },
    ]
  },
  babel: { presets: ['es2015'] },
  watchOptions: { poll: 1000 }
};
