import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets =["name", "nameerrors", "email","emailerrors" ,"password","passworderrors","passwordconfirmation","passwordconfirmationerrors", "phone", "phoneerrors", "address", "addresserrors"]

  submit_form(event){
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
    console.log("Xin chào");
    event.preventDefault();
    let isValid = true;
    if (this.nameTarget.value == ""){
      this.nameerrorsTarget.textContent = "Name cant be blank";
      isValid = false;
    }
    else{
      this.nameerrorsTarget.textContent = ""
    }

    if (this.emailTarget.value == ""){
      this.emailerrorsTargets[0].textContent = "Email cant be blank";
      isValid = false;
    }
    else{
      this.emailerrorsTargets[0].textContent = ""
    }
    if (!emailRegex.test(this.emailTarget.value)) {
        this.emailerrorsTargets[1].textContent = "Invalid email address"
      } 
    else {
        this.emailerrorsTargets[1].textContent = ""
    }

    if (this.passwordTarget.value == ""){
      this.passworderrorsTargets[0].textContent = "Password cant be blank";
      isValid = false;
    }
    else{
      this.passworderrorsTargets[0].textContent = ""
    }

    console.log(this.passwordTarget.value.length);
    if (this.passwordTarget.value.length < 6){
      this.passworderrorsTargets[1].textContent = "Password length must be greater than 6";
      isValid = false;
    }
    else{
      this.passworderrorsTargets[1].textContent = ""
    }

    if (this.passwordTarget.value == this.passwordconfirmationTarget.value ){
      this.passwordconfirmationerrorsTarget.textContent = "";
      isValid = true;
    }
    else{
      this.passwordconfirmationerrorsTarget.textContent = "Password and Password confirm dont match"
    }

    if (this.phoneTarget.value == ""){
        this.phoneerrorsTarget.textContent = "Phone cant be blank";
        isValid = false;
    }
    else{
      this.phoneerrorsTarget.textContent = "";
    }
    if (this.addressTarget.value == ""){
      this.addresserrorsTarget.textContent = "Address cant be blank";
      isValid = false;
    }
    else{
      this.addresserrorsTarget.textContent = "";
    }


    if (isValid == true){
      document.getElementById("UserForm").submit()
    }
  }
}
