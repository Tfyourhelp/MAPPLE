import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.validateForm()
  }
  
  validateForm () {
    console.log('c')
    $('.btn-submit-form').on('click', function(event) {

      event.preventDefault();
      console.log('aaa')
      let isValid = true;

      const phone = $('.input-phone').val()
      if (phone.length == 0) {
        $('.input-phone').addClass('error-input')
        $('.input-phone').closest('.el-phone').find('.invalid-error').html('Please fill your phone')
        isValid = false;
      } else if (phone.length > 11 || phone.length < 9) {
        $('.input-phone').addClass('error-input')
        $('.input-phone').closest('.el-phone').find('.invalid-error').html('Phone length must be between 9 digits and 11 digits')
        isValid = false;
      } else {
        //$('.input-phone').removeClass('error-input')
        $('.input-phone').addClass('correct-input')
        $('.input-phone').closest('.el-phone').find('.invalid-error').html('')
      } 

      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
      const email = $('.input-email').val()

      // if (email.length == 0){
      //   $('.input-email').addClass('error-input')
      //   $('.input-email').closest('.el-email').find('.invalid-error').html('Please fill your email')
      //   isValid = false;
      // } else {
      //   $('.input-email').addClass('correct-input')
      //   $('.input-email').closest('.el-email').find('invalid-error').html('ddf')
      // }

      const name = $('.input-name').val()
      if (name.length == 0){
        $('.input-name').addClass('error-input')
        $('.input-name').closest('.el-name').find('.invalid-error').html('Please fill your name')
        isValid = false;
      }
      else{
        $('.input-name').addClass('correct-input')
        $('.input-name').closest('.el-name').find('.invalid-error').html('')
      }

      const address = $('.input-address').val()
      if (address.length == 0){
        $('.input-address').addClass('error-input')
        $('.input-address').closest('.el-address').find('.invalid-error').html('Please fill your address')
        isValid = false;
      } else{
        $('.input-address').addClass('correct-input')
        $('.input-address').closest('.el-address').find('.invalid-error').html('')
      }

      if (isValid == true){
        document.getElementById("EditUserForm").submit()
      }
    })
  }

  // validateForm (event) {
  //   console.log('c')
  //   const phone = event.target.form.phone.value;
  //   if (phone.length == 0) {
  //     $('.input-phone').addClass('input-error')
  //     $('.input-phone').closest('.el-phone').find('.invalid-error').html('please fill phone')
  //   } else if (phone.length > 11 || phone.length < 9) {
  //     $('.input-phone').addClass('input-error')
  //     $('.input-phone').closest('.el-phone').find('.invalid-error').html('cvvv')
  //   } else {
  //     $('.input-phone').removeClass('input-error')
  //     $('.input-phone').closest('.el-phone').find('.invalid-error').html('')
  //   }
  // }
}
