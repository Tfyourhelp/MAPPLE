import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-to-cart"
export default class extends Controller {
  connect() {
    this.addtoCartinProductShow()
    this.addtoCartinMain()
  }

  addtoCartinProductShow() {
    $(document).on('click', '.add-to-cart-in-product-show', function(e) {
      
      var cartitemquantity = $("#quantityInput").val();
      const url = $(this).data('url');
      const productId = $(this).data('product-id');
      const productQuantity = $(this).data('product-quantity');
  
      if (cartitemquantity > productQuantity || cartitemquantity <= 0) {
        console.log('erro');
        Swal.fire({
          icon: "error",
          title: "Oops...",
          text: `Available quantity of this product is ${productQuantity}`,
          footer: '<a href="#">Why do I have this issue?</a>'
        });
      } else {

        Swal.fire({
          //position: "top-end",
          icon: "success",
          title: "Add to cart success",
          showConfirmButton: false,
          timer: 1000
        });


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
          }
        });
      }
    });
  }
  
  addtoCartinMain(){
    $(document).on('click', '.add-to-cart', function(e) {
      const url = $(this).data('url')
      const productId = $(this).data('product-id')

      Swal.fire({
        //position: "top-end",
        icon: "success",
        title: "Add to cart success",
        showConfirmButton: false,
        timer: 1000
      });

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
        }
      })
    })
  }
}
