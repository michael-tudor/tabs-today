jQuery(document).ready(function () {
  jQuery('.grid-stack').gridstack({
    float: true,
    animate: true,
    cellHeight: '30px'
  });
  var grid = jQuery('.grid-stack').data('gridstack');

  jQuery.ajax({
    url: '/marks/grid.json',
    data: {},
    method: 'get',
    dataType: 'json',
    cache: false,
    success: function (result) {
      jQuery.each(result, function (i, mark) {
        element = jQuery('<div class="grid-stack-item"><div class="grid-stack-item-content">' + mark.title + '</div></div>');
        grid.add_widget(element, mark.x, mark.y, mark.width, mark.height);
      });
    }
  });

});
