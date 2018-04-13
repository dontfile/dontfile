// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery3
//= require jquery_ujs
//= require_tree .

// This function saves all text modifications
function saveText() {
  var element = $("#text");
  var path = "/" + element.attr("data-path");
  var pageText = element.val();
  console.log(">" + pageText + "<")

  $.ajax({
    url: path,
    type: "PATCH",
    data: {
      page: {
        content: pageText
      }
    },
    success: function (resp) { }
  })
}
