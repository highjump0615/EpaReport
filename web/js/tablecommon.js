/**
 * Created by high on 2017/8/2.
 */

function initTable(identifier) {
    var t = $(identifier).DataTable({
        'ordering': false,
        'fnDrawCallback': function() {
            var api = this.api();
            var startIndex = api.context[0]._iDisplayStart;
            api.column(0).nodes().each(function(cell, i) {
                cell.innerHTML = startIndex + i + 1;
            });
        }
    });

    return t;
}
