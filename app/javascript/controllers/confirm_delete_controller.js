import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="confirm-delete"
export default class extends Controller {
  connect(){
    console.log('a')
    // this.confirm_delete_product()
    // this.confirm_delete_category()
  }

  confirm_delete_category(event){

    console.log('b');
    event.preventDefault();
    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: "btn btn-success m-3 ",
        cancelButton: "btn btn-danger m-3 "
      },
      buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
      title: "Are you sure delete this category?",
      text: "You won't be able to change this!",
      icon: "question",
      showCancelButton: true,
      confirmButtonText: "Yes, go delete!",
      cancelButtonText: "No, cancel!",
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {
        event.target.closest('form').submit();
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

  confirm_delete_product(event){

    event.preventDefault();
    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: "btn btn-success m-3 ",
        cancelButton: "btn btn-danger m-3 "
      },
      buttonsStyling: false
    });
    swalWithBootstrapButtons.fire({
      title: "Are you sure delete this product?",
      text: "You won't be able to change this!",
      icon: "question",
      showCancelButton: true,
      confirmButtonText: "Yes, go delete!",
      cancelButtonText: "No, cancel!",
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {
        event.target.closest('form').submit();
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
