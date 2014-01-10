;(function($) {
    /* example can be found at http://www.edicy.com/developer/code-examples/javascript-tricks/ajax-forms */
    
    var defaults = {
        success: function(text) {
            // alert(text);
        },
        error: function(text) {
            // alert(text);
        },
        formdata_error: "Your browser is too old to support file upload from this form."
    };
    
    var EdicyAjaxForm = function(el, options) {
        this.$el = $(el);
        this.id = $(el).attr('id');
        this.options = $.extend(defaults, options);
        this.init();
    };
    
    EdicyAjaxForm.prototype = {
        init: function() {
            this.$el.submit($.proxy(this.handleSubmit, this));
            if (!window.FormData) {
                this.$el.find('.form_field_file').after('<div class="form_field_error">' + this.options.formdata_error + '</div>');
            }
        },
        
        handleSubmit: function(event) {
            event.preventDefault();
            $('.form_submit input').replaceWith('<div class="feedback-loading"><span></span><span></span><span></span></div>');
            var params = {
                    method: 'post',
                    url: window.location,
                    success: $.proxy(this.handleAjaxSuccess, this),
                    error: $.proxy(this.handleAjaxError, this)
                };
            
            if (window.FormData) {
                params.data = new FormData(this.$el.get(0));
                params.cache = false;
                params.contentType = false;
                params.processData = false;
            } else {
                params.data = this.$el.serialize();
            }
            
            this.clearErrors();
            $.ajax(params);
        },
        
        handleAjaxSuccess: function(data) {
            var $resultForm = $(data).find('#' + this.id);
            var $sendButtonText = $resultForm.find('.form_submit input').val();
            if ($resultForm.find('.form_error').length > 0) {
                this.showErrors($resultForm);
                $('.form_field_required').addClass("form_field_with_errors");
                $mainError = $resultForm.find('.form_error').clone().text();
                $('.feedback-loading').parent().replaceWith('<div class="feedback-error"><span>' + $mainError + '</span><button class="close-btn"></button></div>');
                $('.form_field_error').css('display','inline');
                $('.close-btn').click(function(event) {
                    event.preventDefault();
                    $(this).parent().replaceWith('<div class="form_submit"><input name="commit" type="submit" value="' + $sendButtonText +'"></div>');
                });
            } else {
                this.formSubmited($resultForm);
                $('.form_field_required').removeClass("form_field_with_errors");
                $sentFeedback = $resultForm.find('.form_notice').clone().text();
                $('.feedback-loading').parent().replaceWith('<div class="feedback-success"><span>' + $sentFeedback +'</span><button class="close-btn"></button></div>');
                $('.close-btn').click(function(event) {
                    event.preventDefault();
                    $(this).parent().replaceWith('<div class="form_submit"><input name="commit" type="submit" value="' + $sendButtonText +'"></div>');
                });
            }
        },
        
        handleAjaxError: function(jqXHR, textStatus, errorThrown) {
            alert('Network error');
        },
        
        clearErrors: function() {
            this.$el.find('.form_field_error, .form_error, .form_notice').remove(); 
        },
        
        showErrors: function($resultForm) {
            var $mainError = $resultForm.find('.form_error').clone(),
                $fields = $resultForm.find('.form_fields .form_field');
                
            // this.$el.find('.form_area').prepend($mainError);
            $fields.each($.proxy(function(idx, field) {
                if ($(field).find('.form_field_error').length > 0) {
                    $(field).find('.form_field_error').prepend(" — ");
                    var $err = $($(field).find('.form_field_error').clone());
                    this.$el.find('.form_fields .form_field:eq('+ idx +') label:first-child').append($err);
                }
            }, this));
            this.options.error($resultForm.find('.form_error').text());
        },
        
        formSubmited: function($resultForm) {
            // this.$el.find('.form_area').prepend($resultForm.find('.form_notice').clone());
            this.options.success($resultForm.find('.form_notice').text());
        }
    };
    
    $.fn.edicyAjaxForm = function (options) {
        return this.each(function () {
            var data = $(this).data('edicyAjaxForm');
            if (!data) {
                $(this).data('edicyAjaxForm', new EdicyAjaxForm(this, options));
            }
        });
    };
    
})(jQuery);