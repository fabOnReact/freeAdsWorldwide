var ready = function() {

    $('#bouncing-button').mouseover(function(){
        var $this = $(this);
        if (!$this.is(":animated"))
            $(this).effect("bounce", { times: 5 }, 2000);
    });

    $('.buttons .btn').mouseover(function(){
        var $this = $(this);
        if (!$this.is(":animated"))
            $(this).effect("bounce", { times: 5 }, 2000);
    });

}

$(document).on('turbolinks:load', ready);

