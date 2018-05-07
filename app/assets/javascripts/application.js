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
//= require activestorage

function getPagePath() {
  const container = $("#container");
  const pagePath = "/" + container.attr("data-path");
  
  return pagePath;
}

// This function saves all text modifications
function saveText() {
  const pageText = $("#text").val();

  $.ajax({
    url: getPagePath(),
    type: "PATCH",
    data: {
      page: {
      content: pageText
      }
    },
    success: function (resp) {}
  })
}

// This function saves all file uploads
function saveFile() {
  // Max size: 10mb
  const MAX_SIZE = 10 * 1000 * 1000;
  const file = $('#file').prop('files')[0];

  if(file.size <=  MAX_SIZE) {
    const form = new FormData();
    form.append('page[file]', file);
  
    $.ajax({
      async: true,
      url: getPagePath(),
      type: 'PATCH',
      processData: false, 
      contentType: false,
      data: form,
      success: function (resp) {
        location.reload();
      }
    }); 
  } else {
    alert("File is too big. Max size is 10mb");
    $('#file').val('');
  }
}

function goToPage() {
  let pagePath = $('#input').val();

  if(pagePath.length > 0) {
    window.location.href = pagePath;
  }
}
