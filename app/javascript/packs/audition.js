$(document).on('turbolinks:load', function() {
  $(document).on('click', '#show-email-modal .modal-footer a', function() {
    var url_string = window.location.href;
    var url = new URL(url_string);

    $.ajax( {
      url: '/update_status_and_send_invite/',
      type: 'GET',
      data: {
        id: $(this).attr('data-id'),
        value: $(this).attr('data-value'),
        content: CKEDITOR.instances['email-content'].getData()
      }
    });
  });
});
