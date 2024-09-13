const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack');

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default'],
  })
);

const config = environment.toWebpackConfig();

config.resolve.alias = {
  jquery: 'jquery/src/jquery',
};
module.exports = environment;

if (process.env.RAILS_ENV != 'production') environment.splitChunks();
