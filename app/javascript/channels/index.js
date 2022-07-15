// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

window.addEventListener('load', function(){

const item_price = document.getElementById("item-price")
const add_tax_price = document.getElementById("add-tax-price")
const profit = document.getElementById("profit")

item_price.addEventListener('input', function() {

    const kakaku = item_price.value
    const item_tax = Math.floor(0.1 * kakaku)
    const item_profit = Math.floor(kakaku - item_tax)

    add_tax_price.innerHTML = item_tax
    profit.innerHTML = item_profit

})
})