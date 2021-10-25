const { environment } = require('@rails/webpacker')
const coffee =  require('./loaders/coffee')
const { default: Popper } = require('popper.js')

const webpack = require('webpack')
environment.plugins.append('Provide',
    new webpack.ProvidePlugin({
        // $: 'jquery',
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery',
        jquery: 'jquery',
        'window.jQuery': 'jquery',
        Popper: ['popper.js', 'default']
    })
)

environment.loaders.prepend('coffee', coffee)
module.exports = environment
