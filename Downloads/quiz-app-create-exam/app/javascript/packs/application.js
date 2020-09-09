// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'bootstrap'
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("chartkick")
require("chart.js")
//= require jquery.countdown
//= require jquery.countdown-es

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
  // var countdown = function() {
  //   $('#clock').countdown({ //clock là thẻ chứa bộ đếm đồng hồ
  //     until: $('#remaining_time').val(), //thời gian đếm
  //     format: 'HMS', //địn dạng thời gian
  //     onExpiry: function() {
  //       $('.submit-time-out').hidden(); //submit khi hết giờ
  //     }
  //   });
  // }
  
  // document.addEventListener('turbolinks:load', countdown);
  // $(document).on('page:update', countdown);