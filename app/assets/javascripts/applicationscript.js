var ready = function() {

    var url = window.location.pathname, // in real app this would have to be replaced with window.location.pathname 
        urlRegExp = new RegExp(url.replace(/\/$/,'')); // create regexp to match current url pathname and remove trailing slash if present as it could collide with the link in navigation in case trailing slash wasn't present there
    
        // now grab every link from the navigation
        $('.sidebar a').each(function(){
            // and test its href against the url pathname regexp
            if(urlRegExp.test(this.href)){
                $(this).parents('li').addClass('active');
            }
        });

    $('.checkboxes').hide();

    if($('#campaign_worldwide_false').is(':checked')) {
        $('.checkboxes').show();
    } else {
        $('.checkboxes').hide();
    }

    $("label[for=campaign_worldwide_true] span.second-icon").click(function () {
    		$('.checkboxes').hide();
    });

    $("label[for=campaign_worldwide_false] span.second-icon").click(function () {
    		$('.checkboxes').show();
    });

}

/*$(document).ready(ready);*/
$(document).on('turbolinks:load', ready);

/*
$( document ).on('turbolinks:load', function() {
  console.log("It works on each visit inside script!")
})*/