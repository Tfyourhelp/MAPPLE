import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="change-quantity-icon-cart"
export default class extends Controller {
  connect() {
    this.changeQuantityIconCart()
  }
  changeQuantityIconCart () {
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
          console.log(res)
        }
      })
    })
  }
}
