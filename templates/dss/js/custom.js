/*
 * Platz für eigenes Javascript
 * Die hier gemachten Änderungen überschreiben ggfs. andere Funktionen, da diese Datei als letzte geladen wird.
 */

$('#more').click(function(e) {
    e.stopPropagation();
    $('.desc.details').css({
        'height': 'auto'
    })
    $(this).addClass("hidden")
    $('#less').addClass("visible")
});
$('#less').click(function(e) {
    e.stopPropagation();
    $('.desc.details').css({
        'height': '150px'
    })
    $(this).addClass("hidden")
    $('#more').addClass("visible")
});

$(document).ready(function() {
    $('#result-wrapper .desc.details').css({
        'height': '150px'
    })
})