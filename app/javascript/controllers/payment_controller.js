import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="payment"
export default class extends Controller {
  payment_success(event){
    event.preventDefault();
    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: "btn btn-success m-3 ",
        cancelButton: "btn btn-danger m-3 "
      },
      buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
      title: "Are you sure?",
      text: "You won't be able to change this!",
      icon: "question",
      showCancelButton: true,
      confirmButtonText: "Yes, go payment!",
      cancelButtonText: "No, cancel!",
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {
        document.getElementById("InfoForm").submit()
        swalWithBootstrapButtons.fire({
          title: "Success!",
          text: "Your order has been paid.",
          icon: "success"
        });
      } else if (
        result.dismiss === Swal.DismissReason.cancel
      ) {
        swalWithBootstrapButtons.fire({
          title: "Cancelled",
          text: "You are back !!",
          icon: "error"
        });
      }
    });
  }
}
