import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like"
export default class extends Controller {
  connect() {
    this.likeProduct()
    this.unlikeProduct()
  }

  unlikeProduct(){
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
        }
      })
    })
  }

  likeProduct(){
    $(document).on('click', '.like-product', function(e) {
      const productId = $(this).data('product-id')
      const url = $(this).data('url') + `/${productId}`
      console.log('like')
      console.log(url)
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
        }
      })
    })
  }
}
