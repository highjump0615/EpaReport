/**
 * Created by high on 2017/8/2.
 */

$(document).ready(function() {
    $('table').dataTable({
        'ordering': false,
        'fnDrawCallback': function() {
            var api = this.api();
            var startIndex = api.context[0]._iDisplayStart;
            api.column(0).nodes().each(function(cell, i) {
                cell.innerHTML = startIndex + i + 1;
            });
        }
    });
});