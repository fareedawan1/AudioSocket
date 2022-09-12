document.addEventListener('turbolinks:load', ()=> {
  let songBtn = document.querySelector('#add-songs-button');

  if (songBtn) {
    songBtn.addEventListener('click', function() {
      let songs = document.querySelectorAll('.nested-fields')
      if (songs.length > 2) {
        $('#add-songs-button').hide();
      }
    })
  }

  function check_to_hide_or_show_add_link() {
    $('#add-songs-button').show();
  }
  $('#container').on('cocoon:after-remove', function() {
    check_to_hide_or_show_add_link();
  });

})
