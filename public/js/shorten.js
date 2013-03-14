$(function(){
  var $form = $('.url_shorten');
  // console.log($f);

  $('.url_shorten').submit(function(e) {
    e.preventDefault();

    console.log('Hooray! Submit was clicked!');

    $.ajax({
      type: 'POST',
      data: $form.serialize(),
      url: "/",
      //dataType: "json" // this is optional if the Content-Type: header is set
    }).done(function(data) {
      console.log(data);
      $('#original_url').html(data.url);
      $('#short_link[href]').attr('href', data.shortened);
      $('a').html('http://localhost:9292/' + data.shortened);
    }).fail(function() { console.log("ERROR!"); });
  });
});
