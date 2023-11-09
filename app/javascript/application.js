// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "./common.js"

$(document).on('click', '.un-like-product', function(e) {
  const url = $(this).data('url')
  const productId = $(this).data('product-id')
  console.log('unlike')
  $.ajax({
    url: url,
    type: 'POST',
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    },
    data: {
      product_id: productId
    },
    success: function(res) {
      // console.log(res)
    }
  })
})


$(document).on('click', '.like-product', function(e) {
  const productId = $(this).data('product-id')
  const url = $(this).data('url') + `/${productId}`
  console.log('like')
  $.ajax({
    url: url,
    type: 'DELETE',
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    },
    data: {
      product_id: productId
    },
    success: function(res) {
      // console.log(res)
    }
  })
})


$(document).on('click', '.add-to-cart', function(e) {
  const url = $(this).data('url')
  const productId = $(this).data('product-id')

  console.log('bbbb')

  $.ajax({
    url: url,
    type: 'POST',
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    },
    data: {
      product_id: productId,
    },
    success: function(res) {
      // console.log(res)
    }
  })
})



$(document).on('click', '.plus-cart-item', function(e) {
  const url = $(this).data('url')
  const productId = $(this).data('product-id')
  const operation = $(this).data('operation')
  const cartitemquantity = $(this).data('cart-item-quantity')
  const productquantity = $(this).data('product-quantity')  
  console.log(cartitemquantity)
  console.log(productquantity)

  if ((cartitemquantity + 1) > productquantity) {
    console.log('unlike')
    Swal.fire({
      icon: "error",
      title: "Oops...",
      text: `Available quantity of this product is ${productquantity}`,
      footer: '<a href="#">Why do I have this issue?</a>'
    });
  }

  
  $.ajax({
    url: url,
    type: 'POST',
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    },
    data: {
      product_id: productId,
      operation: operation,
    },
    success: function(res) {
      // console.log(res)
    }
  })
})


$(document).on('click', '.minus-cart-item', function(e) {
  const url = $(this).data('url')
  const productId = $(this).data('product-id')
  const operation = $(this).data('operation')
  console.log('like')
  
  $.ajax({
    url: url,
    type: 'POST',
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    },
    data: {
      product_id: productId,
      operation: operation,
    },
    success: function(res) {
      // console.log(res)
    }
  })
})


