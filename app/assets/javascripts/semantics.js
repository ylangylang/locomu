
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

    $('.image.user_photo')
        .popup({
            inline: true,
            position : 'top center'
        })
    ;

    $('.user_photo.modal')
        .transition('attach events', '.cancel.button', 'fade up')
    ;

    })
;