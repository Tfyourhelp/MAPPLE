import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.edituserForm()
    this.newuserForm()
    this.editshopForm()
  }
  
  edituserForm () {
    console.log('c')
    $('.btn-edit-form-submit').on('click', function(event) {

      event.preventDefault();
      console.log('aaa')
      let isValid = true;

      const phone = $('.input-phone').val()
      if (phone.length == 0) {
        $('.input-phone').removeClass('correct-input');
        $('.input-phone').addClass('error-input')
        $('.input-phone').closest('.el-phone').find('.invalid-error').html('Please fill your phone')
        isValid = false;
      } else if (phone.length > 11 || phone.length < 9) {
        $('.input-phone').removeClass('correct-input');
        $('.input-phone').addClass('error-input')
        $('.input-phone').closest('.el-phone').find('.invalid-error').html('Phone length must be between 9 digits and 11 digits')
        isValid = false;
      } else {
        $('.input-phone').removeClass('error-input')
        $('.input-phone').addClass('correct-input')
        $('.input-phone').closest('.el-phone').find('.invalid-error').html('')
      } 

      const name = $('.input-name').val()
      if (name.length == 0){
        $('.input-name').removeClass('correct-input');
        $('.input-name').addClass('error-input')
        $('.input-name').closest('.el-name').find('.invalid-error').html('Please fill your name')
        isValid = false;
      }
      else{
        $('.input-name').removeClass('error-input');
        $('.input-name').addClass('correct-input')
        $('.input-name').closest('.el-name').find('.invalid-error').html('')
      }

      const address = $('.input-address').val()
      if (address.length == 0){
        $('.input-address').removeClass('correct-input');
        $('.input-address').addClass('error-input')
        $('.input-address').closest('.el-address').find('.invalid-error').html('Please fill your address')
        isValid = false;
      } else{
        $('.input-address').removeClass('correct-input');
        $('.input-address').addClass('correct-input')
        $('.input-address').closest('.el-address').find('.invalid-error').html('')
      }

      if (isValid == true){
        document.getElementById("EditUserForm").submit()
      }
    })
  }

  newuserForm () {
    
    $('.btn-new-form-submit').on('click', function(event) {
      console.log('e')
      event.preventDefault();
      console.log('aaa')
      let isValid = true;

      const phone = $('.input-phone').val()
      if (phone.length == 0) {
        $('.input-phone').removeClass('correct-input');
        $('.input-phone').addClass('error-input')
        $('.input-phone').closest('.el-phone').find('.invalid-error').html('Please fill your phone')
        isValid = false;
      } else if (phone.length > 11 || phone.length < 9) {
        $('.input-phone').removeClass('correct-input');
        $('.input-phone').addClass('error-input')
        $('.input-phone').closest('.el-phone').find('.invalid-error').html('Phone length must be between 9 digits and 11 digits')
        isValid = false;
      } else {
        $('.input-phone').removeClass('error-input');
        $('.input-phone').addClass('correct-input')
        $('.input-phone').closest('.el-phone').find('.invalid-error').html('')
      } 

      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
      const email = $('.input-email').val()

      if (email.length == 0){
        $('.input-email').removeClass('correct-input');
        $('.input-email').addClass('error-input')
        $('.input-email').closest('.el-email').find('.invalid-error').html('Please fill your email')
        isValid = false;
      } else {
        $('.input-email').removeClass('error-input');
        $('.input-email').addClass('correct-input')
        $('.input-email').closest('.el-email').find('invalid-error').html('ddf')
      }

      const name = $('.input-name').val()
      if (name.length == 0){
        $('.input-name').removeClass('correct-input');
        $('.input-name').addClass('error-input');
        $('.input-name').closest('.el-name').find('.invalid-error').html('Please fill your name');
        isValid = false;
      }
      else{
        $('.input-name').removeClass('error-input');
        $('.input-name').addClass('correct-input')
        $('.input-name').closest('.el-name').find('.invalid-error').html('')
      }

      const password = $('.input-password').val()
      if (password.length == 0){
        $('.input-password').removeClass('correct-input')
        $('.input-password').addClass('error-input')
        $('.input-password').closest('.el-password').find('.invalid-error').html('Please fill your password')
        isValid = false;
      }
      else{
        $('.input-password').removeClass('error-input')
        $('.input-password').addClass('correct-input')
        $('.input-password').closest('.el-name').find('.invalid-error').html('')
      }

      const passwordConfirmation = $('.input-password-confirmation').val()
      if (passwordConfirmation.length == 0){
        $('.input-password-confirmation').removeClass('correct-input')
        $('.input-password-confirmation').addClass('error-input')
        $('.input-password-confirmation').closest('.el-password-confirmation').find('.invalid-error').html('Please fill your password confirmation')
        isValid = false;
      }
      else if( password != passwordConfirmation){
        $('.input-password-confirmation').removeClass('correct-input')
        $('.input-password-confirmation').addClass('error-input')
        $('.input-password-confirmation').closest('.el-password-confirmation').find('.invalid-error').html('Password and password confirmation do not match')
        isValid = false;
      }
      else{
        $('.input-password-confirmation').removeClass('error-input')
        $('.input-password-confirmation').addClass('correct-input')
        $('.input-password-confirmation').closest('.el-password-confirmation').find('.invalid-error').html('')
      }

      const address = $('.input-address').val()
      if (address.length == 0){
        $('.input-address').removeClass('correct-input')
        $('.input-address').addClass('error-input')
        $('.input-address').closest('.el-address').find('.invalid-error').html('Please fill your address')
        isValid = false;
      } else{
        $('.input-address').removeClass('error-input')
        $('.input-address').addClass('correct-input')
        $('.input-address').closest('.el-address').find('.invalid-error').html('')
      }

      if (isValid == true){
        document.getElementById("NewUserForm").submit()
      }
    })
  }

  editshopForm () {
    
    $('.btn-edit-shop-form-submit').on('click', function(event) {
      console.log('e')
      event.preventDefault();
      console.log('aaa')
      let isValid = true;

      const phone = $('.input-phone').val()
      if (phone.length == 0) {
        $('.input-phone').removeClass('correct-input');
        $('.input-phone').addClass('error-input')
        $('.input-phone').closest('.el-phone').find('.invalid-error').html('Please fill your phone')
        isValid = false;
      } else if (phone.length > 11 || phone.length < 9) {
        $('.input-phone').removeClass('correct-input');
        $('.input-phone').addClass('error-input')
        $('.input-phone').closest('.el-phone').find('.invalid-error').html('Phone length must be between 9 digits and 11 digits')
        isValid = false;
      } else {
        $('.input-phone').removeClass('error-input');
        $('.input-phone').addClass('correct-input')
        $('.input-phone').closest('.el-phone').find('.invalid-error').html('')
      } 
    
      console.log('iii')
      const name = $('.input-name').val()
      if (name.length == 0){
        $('.input-name').removeClass('correct-input');
        $('.input-name').addClass('error-input');
        $('.input-name').closest('.el-name').find('.invalid-error').html('Please fill your name');
        isValid = false;
      }
      else{
        $('.input-name').removeClass('error-input');
        $('.input-name').addClass('correct-input')
        $('.input-name').closest('.el-name').find('.invalid-error').html('')
      }
      console.log('uuu')
      const address = $('.input-address').val()
      if (address.length == 0){
        $('.input-address').removeClass('correct-input')
        $('.input-address').addClass('error-input')
        $('.input-address').closest('.el-address').find('.invalid-error').html('Please fill your address')
        isValid = false;
      } else{
        $('.input-address').removeClass('error-input')
        $('.input-address').addClass('correct-input')
        $('.input-address').closest('.el-address').find('.invalid-error').html('')
      }
      console.log('kkk')
      const description = $('.input-description').val()
      if (description.length == 0){
        $('.input-description').removeClass('correct-input')
        $('.input-description').addClass('error-input')
        $('.input-description').closest('.el-description').find('.invalid-error').html('Please fill your description')
        isValid = false;
      } else{
        $('.input-description').removeClass('error-input')
        $('.input-description').addClass('correct-input')
        $('.input-description').closest('.el-description').find('.invalid-error').html('')
      }

      console.log('lll')
      const taxcode = $('.input-tax-code').val()
      if (taxcode.length == 0){
        $('.input-tax-code').removeClass('correct-input')
        $('.input-tax-code').addClass('error-input')
        $('.input-tax-code').closest('.el-taxcode').find('.invalid-error').html('Please fill your taxcode')
        isValid = false;
      } 
      else if (taxcode.length != 10){
        $('.input-tax-code').removeClass('correct-input')
        $('.input-tax-code').addClass('error-input')
        $('.input-tax-code').closest('.el-taxcode').find('.invalid-error').html('Tax code length must be 10')
        isValid = false;
      } 
      else{
        $('.input-tax-code').removeClass('error-input')
        $('.input-tax-code').addClass('correct-input')
        $('.input-tax-code').closest('.el-taxcode').find('.invalid-error').html('')
      }
      console.log('qqq')
      if (isValid == true){
        document.getElementById("EditShopForm").submit()
      }
    })
  }
}
