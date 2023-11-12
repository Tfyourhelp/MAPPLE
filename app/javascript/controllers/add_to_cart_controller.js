import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-to-cart"
export default class extends Controller {
  connect() {
    this.addtoCartinProductShow()
    this.addtoCartinMain()
  }

  addtoCartinProductShow(){
    $(document).on('click', '.add-to-cart-in-product-show', function(e) {
      
      var cartitemquantity = $("#quantityInput").val();
      const url = $(this).data('url')
      const productId = $(this).data('product-id')
      const productQuantity = $(this).data('product-quantity')

      console.log('bbbb')
      console.log(productId)
      console.log(cartitemquantity)
      
      if (cartitemquantity  > productQuantity) {
        console.log('erro')
        Swal.fire({
          icon: "error",
          title: "Oops...",
          text: `Available quantity of this product is ${productQuantity}`,
          footer: '<a href="#">Why do I have this issue?</a>'
        });
      }
      else {
        $.ajax({
          url: url,
          type: 'POST',
          headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
          },
          data: {
            product_id: productId,
            quantity: cartitemquantity
          },
          success: function(res) {
            // console.log(res)
          }
        })
      }
    }
  )
}

  addtoCartinMain(){
    $(document).on('click', '.add-to-cart', function(e) {
      const url = $(this).data('url')
      const productId = $(this).data('product-id')
      console.log('bbbb')
      console.log(productId)

      

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
