// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "./common.js"

// $(document).ready(function(){
//   $('#unlike').on('click', function(){
//     $("button").click(function(){
//       if(this.id == "button1") {
//         alert("Button 1 được nhấn");
//       } else if (this.id == "button2") {
//         alert("Button 2 được nhấn");
//       }
//     });
//   });
// });

// $(document).ready(function(){
//   $(".unlike-button").click(function(event){
//     event.preventDefault(); 

//     $.ajax({
//       url: `/likes`,
//       type: 'POST',
//       dataType: 'json',
//       success: function(data) {
//         alert(data.message);
//       },
//       error: function(error) {
//         alert("Đã xảy ra lỗi khi thực hiện Unlike");
//       }
//     });
//   });
// });


// $(document).ready(function(){
//   $("#LikeForm").submit(function(event){
//     event.preventDefault();
    
//     $.ajax({
//       url: `likes`,
//       type: 'POST',
//       dataType: 'json',
//       success: function(data) {
//         alert(data.message);
    
//         $("#LikeForm").hide();
//         $("#UnlikeButton").show();
//       },
//       error: function(error) {
//         alert("Cannot Like");
//       }
//     });
//   });


//   $("#UnlikeButton").click(function(event){
//     event.preventDefault();
//     var productId = $("#UnlikeButton").data("product_id");
//     $.ajax({
//       url: `/likes?product_id=` + productId,
//       type: 'DELETE',
//       dataType: 'json',
//       success: function(data) {
//         alert(data.message);
  
//         $("#UnlikeButton").hide();
//         $("#LikeForm").show();
//       },
//       error: function(error) {
//         alert("Cannot Unlike");
//       }
//     });
//   });
// });