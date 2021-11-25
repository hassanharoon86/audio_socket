$(document).on('turbolinks:load', function() {
  $('.manager-selection').on('change', function() {
    $('#tr'+this.getAttribute('data-audition-id')).find("td:eq(5)").html(this.value);

    $.get('/update_assigned_to/', { id: this.getAttribute('data-audition-id'), assigned_to: this.value} )
  });
});
