// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
// import "channels"

// Rails.start()
// Turbolinks.start()
// ActiveStorage.start()

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("@nathanvda/cocoon")

import 'bootstrap'


$(document).on('turbolinks:load', function () {
  $("#hear-about").on('change', function() {
    if(this.value == 'Other'){
      $('#other-field').fadeIn();
    }
    else{
      $('#other-field').fadeOut();
    }
  });
});

$(document).on('cocoon:after-insert', function(){
  if($(".nested-fields").length == 4) {
    $('#add-link').removeClass('d-flex').hide();
  }
});

$(document).on('cocoon:after-remove', function(){
  if($(".nested-fields").length < 4){
    $('#add-link').addClass('d-flex').fadeIn();
  }
})
