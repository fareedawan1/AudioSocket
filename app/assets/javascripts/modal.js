$(document).ready(function() {
  if ($('#audition-show')) {
    $('.clickable-row').click(function(element) {
      const { url } = element.currentTarget.dataset
      $.ajax(url, {
          type: 'Get'
      });
    });
  }
});
