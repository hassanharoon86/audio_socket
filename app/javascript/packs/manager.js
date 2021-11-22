$(document).on('turbolinks:load', function() {
  $('.manager-selection').on('change', function() {
    $('#tr'+this.getAttribute('data-audition-id')).find("td:eq(5)").html(this.value.split('@')[0])

    $.get('/update_assigned_to/', {audition_id: this.getAttribute('data-audition-id'), assigned_to: this.value})
  });
});
