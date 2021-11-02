$(document).on('turbolinks:load', function() {
  $('.manager-selection').on('change', function() {
    var url_string = window.location.href;
    var url = new URL(url_string);

    $.ajax({
      url: '/update_assigned_to/',
      type:'GET',
      data: {
        audition_id: this.getAttribute('data-audition-id'),
        assigned_to: this.value,
      }
    });
  });
});
