Dropzone.autoDiscover = false // disable the built-in autodiscovery
$(document).on("turbolinks:load", Dropzone.discover)

$(document).on('turbolinks:load', function() {
  $('.dz-message').html(
    `
    <div>
      <h2 class='mb-0'><i class='fa fa-icon fa-file-image-o text-secondary'></i></h2>
      <br>
      Arrastra tus archivos aquí
    <div/>
    `
  );

  if (Dropzone.instances.length > 0) {
    Dropzone.instances.forEach(function(instance) {
      instance.on('queuecomplete', function() {
        window.location.reload(true);
      });
    });
  }
});
