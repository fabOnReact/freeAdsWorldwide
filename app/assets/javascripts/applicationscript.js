var ready
ready = function() {

    var url = window.location.pathname, // in real app this would have to be replaced with window.location.pathname 
        urlRegExp = new RegExp(url.replace(/\/$/,'')); // create regexp to match current url pathname and remove trailing slash if present as it could collide with the link in navigation in case trailing slash wasn't present there
    
        // now grab every link from the navigation
        $('.sidebar a').each(function(){
            // and test its href against the url pathname regexp
            if(urlRegExp.test(this.href)){
                $(this).parents('li').addClass('active');
            }
        });

    /*$(".first-icon").click(function () {
    		$('').hide()
    });*/

    $('.checkboxes').hide();

    $("label[for=campaign_worldwide_true] span.second-icon").click(function () {
    		$('.checkboxes').hide();
    		/*toggle("fold", 1000);*/
    });

    $("label[for=campaign_worldwide_false] span.second-icon").click(function () {
    		$('.checkboxes').show();
    		/*toggle("fold", 1000);*/
    });
}

$(document).ready(ready);
$(document).on('turbolinks:load', ready);