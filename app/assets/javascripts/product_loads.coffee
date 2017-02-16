jQuery ->
  $('#product_loads').dataTable(
    columnDefs: [ targets: [-3, -2, -1], orderable: false ]
)
