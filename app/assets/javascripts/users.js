
$(document)
.ready(function() {

    $('.ui.rating')
    .rating({
          clearable: true
        })
  ;

    $('.ui.sidebar')
    .sidebar('attach events', '.launch.button')
  ;

    $('.ui.dropdown')
        .dropdown()
    ;

    $('.ui.checkbox')
        .checkbox()
    ;
})
;