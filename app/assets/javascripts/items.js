$(document).ready(function() {
  $('.assignee-select').change(function() {
    $(this).parent('form').trigger('submit.rails');
  });
});
