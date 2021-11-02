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

$(document).on('cocoon:after-insert', function() {
  if($(".nested-fields").length == 4) {
    $('#add-link').removeClass('d-flex').hide();
  }
});

$(document).on('cocoon:after-remove', function() {
  if($(".nested-fields").length < 4){
    $('#add-link').addClass('d-flex').fadeIn();
  }
})
