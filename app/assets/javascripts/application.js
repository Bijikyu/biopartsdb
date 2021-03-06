// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require jquery.imgareaselect
//= require jquery.maphilight
//= require twitter/bootstrap
//= require_tree .

/* select all for checkboxes */
$('.checkall').click(function () {
    $(this).parent().parent().parent().find(':checkbox').prop('checked', this.checked);
    });
/* create image annotation */
$(document).ready(function(){
    $("#toAnnotate").imgAreaSelect({
onSelectEnd: function (img, selection) {
var coords = "";
coords = selection.x1 + "," + selection.y1 + "," + selection.x2 + "," + selection.y2;
if (!(selection.x1==selection.x2 && selection.y1 == selection.y2)){
$("#position").val(coords);
}else{
$("#position").val("");
}
}
});
    });
/* highlight image area */
$(document).ready(function(){
    $('#gel_image').maphilight({fillColor: 'ffffff', fillOpacity: 0.1, strokeColor: 'ffffff'});
    });
