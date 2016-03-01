$(function() {
  $( "#sortable, #sortable2" ).sortable({
    connectWith: ".connectedSortable"
  }).disableSelection();
});
