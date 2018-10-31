/*!
 * Start Bootstrap - Grayscale Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */

// jQuery to collapse the navbar on scroll
function collapseNavbar() {
    if ($(".navbar").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
    }
}

$(window).scroll(collapseNavbar);
$(document).ready(collapseNavbar);

// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});

// Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click(function() {
    $(".navbar-collapse").collapse('hide');
});


//Hide flash notice msgs
$(function(){
    setTimeout(function(){
        $("div.alert.alert-notice").remove();
    }, 5000 ); // 5 sec
});

//Hide flash error msgs
$(function(){
    setTimeout(function(){
        $("div.alert.alert-alert").remove();
    }, 5000 ); // 5 sec
});


//Enable chosen js
document.addEventListener("turbolinks:load", function() {
  $('.chosen-select').chosen({
        width: '200px'
    });
});


// Prevent enter key from submitting forms
function preventEnterSubmit(e) {
    if (e.which == 13) {
        var $targ = $(e.target);

        if (!$targ.is("textarea") && !$targ.is(":button,:submit")) {
            var focusNext = false;
            $(this).find(":input:visible:not([disabled],[readonly]), a").each(function(){
                if (this === e.target) {
                    focusNext = true;
                }
                else if (focusNext){
                    $(this).focus();
                    return false;
                }
            });

            return false;
        }
    }
}


$(document).ready(function(){
    $('.datepicker-reachout').datepicker({
        todayHighlight: true, 
        orientation: 'auto top', 
        format: 'yyyy-mm-dd'
    }); 
});




