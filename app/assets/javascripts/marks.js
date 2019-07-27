jQuery(document).ready(function () {
  if (jQuery('.grid-stack').length == 1) {
    jQuery('.grid-stack').gridstack({
      float: true,
      animate: true,
      cellHeight: '30px'
    });

    jQuery.ajax({
      url: '/marks.js',
      method: 'get',
      dataType: 'script',
      cache: false
    });
  }
});
