import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  connect() {
    // this.fetchData()
    // console.log('sdfdf')
    // Swal.fire({
    //   title: "Good job!",
    //   text: "You clicked the button!",
    //   icon: "success"
    // });
  }
  
  fetchData(){
    $("#LikeForm").submit(function(event){
      event.preventDefault();
      
      $.ajax({
        url: `/likes`,
        type: 'POST',
        dataType: 'json',
        success: function(data) {
          alert(data.message);

          var likeCountElement = $("#likecount");
          likeCountElement.text(parseInt(likeCountElement.text()) + 1);
          
          $("#LikeForm").hide();
          $("#UnlikeButton").show();
        },
        error: function(error) {
          alert("Cannot Like");
        }
      });
    });

    $("#UnlikeButton").click(function(event){
      event.preventDefault();

      var productId = $("#UnlikeButton").data("product_id");
      $.ajax({
        url: `/likes?product_id=` + productId,
        type: 'DELETE',
        dataType: 'json',
        success: function(data) {
          alert(data.message);
          
          var likeCountElement = $("#likecount");
          likeCountElement.text(parseInt(likeCountElement.text()) -1);
          
          $("#UnlikeButton").hide();
          $("#LikeForm").show();
        },
        error: function(error) {
          alert("Cannot Unlike");
        }
      });
    });
  }
}

