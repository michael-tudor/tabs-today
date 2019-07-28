jQuery(document).ready(function () {
  var grid_stack = jQuery('.grid-stack');
  var we_listen = 'form.mark-form input, form.mark-form textarea';
  var on_send_events = ['change', 'keyup'];
  var timer_id = 0;

  // github.com/rails/rails/issues/29546#issuecomment-313572043
  function sendForm (form) {
    clearTimeout(timer_id);
    timer_id = setTimeout(function () {
      Rails.fire(form[0], 'submit');
    }, 5000);
  }

  if (grid_stack.length == 1) {
    grid_stack.gridstack({
      float: true,
      animate: true,
      cellHeight: '40px'
    });

    jQuery.ajax({
      url: '/marks.js',
      method: 'get',
      dataType: 'script',
      cache: false
    });

    jQuery.each(on_send_events, function (i, event_name) {
      grid_stack.on(event_name, we_listen, function () {
        sendForm(jQuery(this).closest('form.mark-form'));
      });
    });
  }
});
