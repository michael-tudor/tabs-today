jQuery(document).ready(function () {
  var grid_stack = jQuery('.grid-stack');
  if (grid_stack.length == 1) {
    var we_listen = 'form.mark-form input, form.mark-form textarea';

    // Load Grid for Tabs
    grid_stack.gridstack({
      float: true,
      animate: true,
      cellHeight: '40px',
      alwaysShowResizeHandle: true
    });

    // Getting Token for Update Grid
    var workspace_authenticity_token = '';
    jQuery.get('/workspaces/token.json', function (data) {
      workspace_authenticity_token = data.token;
    });

    // Load Tabs
    jQuery.ajax({
      url: '/marks.js',
      method: 'GET',
      dataType: 'script',
      cache: false
    });

    // Save New data in Tab
    // github.com/rails/rails/issues/29546#issuecomment-313572043
    grid_stack.on('change', we_listen, function () {
      Rails.fire(jQuery(this).closest('form.mark-form')[0], 'submit');
    });

    // Save Positions and Sizes
    var grid_stack_timer_id = 0;
    grid_stack.on('change', function (event, items) {
      clearTimeout(grid_stack_timer_id);
      grid_stack_timer_id = setTimeout(function () {
        workspace_id = grid_stack.attr('data-workspace-id');
        if (!workspace_id) { return false; }

        positions_and_sizes = [];
        jQuery('.grid-stack-item.ui-draggable').not('.add-new-mark').each(function () {
          self = jQuery(this);
          node = self.data('_gridstack_node');
          positions_and_sizes.push({
            x: node.x,
            y: node.y,
            w: node.width,
            h: node.height,
            id: self.attr('id').replace('mId', '')
          });
        });
        workspace_data = {
          authenticity_token: workspace_authenticity_token,
          workspace: { positions_and_sizes: JSON.stringify(positions_and_sizes) }
        }

        jQuery.ajax({
          url: ('/workspaces/' + workspace_id),
          method: 'PATCH',
          dataType: 'json',
          cache: false,
          data: workspace_data
        });
      }, 1500);
    });
  }
});
