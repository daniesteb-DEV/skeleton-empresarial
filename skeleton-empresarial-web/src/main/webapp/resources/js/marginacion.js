function focusNext(actual, siguiente) {
    if ($('input[id="' + actual + '"]').val().length === 1) {
        $('input[id="' + siguiente + '"]').focus();
        $('input[id="' + siguiente + '"]').select();
    }
}
