/* 编辑窗口 */
function open_edit(title, url, w, h){
    layer_show(title,url,w,h);
}

function enableSubmit(enable) {
    var objSubmit = $('#but_submit');
    if (enable) {
        objSubmit.removeClass('disabled');
        objSubmit.removeAttr('disabled');
    }
    else {
        objSubmit.addClass('disabled');
        objSubmit.attr('disabled');
    }
}