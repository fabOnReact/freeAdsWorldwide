var ready = function() {

    $('#parallax-button').mouseover(function(){
        var $this = $(this);
        if (!$this.is(":animated"))
            $(this).effect("bounce", { times: 5 }, 2000);
    });

}

$(document).on('turbolinks:load', ready);

