{% editorjsblock %}
  <script src='/assets/admin/tools/0.1.1/edicy-tools.js'></script>
  <script>
    // Body background image and color data preview and save logic
    var pageData = new Edicy.CustomData({
      type: 'page',
      id: '{{ page.id }}'
    });

    var bgPickerBody = new Edicy.BgPicker($('.js-bgpicker-body-settings'), {
      picture: true,
      color: true,

      preview: function(data) {
        var img = (data.image && data.image !== '') ? 'url("' + data.image + '")' : 'none',
            col = (data.color && data.color !== '') ? data.color : 'none';

        $('.js-bgpicker-body-image').css({'background-image' : img});
        $('.js-bgpicker-body-color').css({'background-color' : col});

        if (data.image === null || data.image === '') {
          $('.js-bgpicker-body-color').css({'opacity' : 1});
        } else {
          $('.js-bgpicker-body-color').css({'opacity' : 0.5});
        }
      },

      commit: function(data) {
        pageData.set({
          'body_image': data.image || '',
          'body_color': data.color || ''
        });
      }
    });
  </script>
{% endeditorjsblock %}
