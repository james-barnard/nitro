# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#owners').dataTable(
    columnDefs: [ targets: [-3, -2, -1], orderable: false ]
)
