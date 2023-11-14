import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="change-quantity-in-cart"
export default class extends Controller {
  connect() {
    this.deleteCartItem()
    this.plusCartItem()
    this.minusCartItem()
    this.inputCartItem()
  }

  deleteCartItem(){
    $(document).on('click', '.delete-cart-item', function(e) {
      const cartitemId = $(this).data('cart-item-id')
      const url = $(this).data('url')
      const cart_items_length = $(this).data('cart-items-length')
      console.log('xin chào')
      console.log(url)
      console.log(cart_items_length)
      console.log(cartitemId)


      $.ajax({
        url: url,
        type: 'DELETE',
        headers: {
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        },
        data: {
          id: cartitemId
        },
        success: function(res) {
          console.log(res);
          console.log(' hello ')
          if (( cart_items_length -1 ) == 0 ){
            window.location.href = '/users/carts';
          }
          console.log(cart_items_length)
        }
      })
    }
    )
  }

  plusCartItem(){
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
  }


  minusCartItem(){
    $(document).on('click', '.minus-cart-item', function(e) {
      const url = $(this).data('url')
      const productId = $(this).data('product-id')
      const operation = $(this).data('operation')
      const cartitemquantity = $(this).data('cart-item-quantity')
      console.log('like')
      
      if (cartitemquantity == 1){
        $(this).prop('disabled', true);
        console.log('hiii');
        return false;
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
  }


  inputCartItem(){
    $(document).on('keypress', '.input-cart-item', function(e) {
      if (e.keyCode === 13) {
        const url = $(this).data('url')
        const productId = $(this).data('product-id')  
        const cartitemquantity = $(this).val();
        const productquantity = $(this).data('product-quantity') 

        console.log('xin chào')
        console.log(cartitemquantity)

        if ((cartitemquantity > productquantity) || ( cartitemquantity <= 0 ) ) {
          console.log('unlike')
          Swal.fire({
            icon: "error",
            title: "Oops...",
            text: `Available quantity of this product is ${productquantity}`,
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
              console.log(res)
            }
          })
        }
      }
    })
  }
}
