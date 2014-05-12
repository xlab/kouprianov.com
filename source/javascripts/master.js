/*
Master file for JS scripts

*= require _js/jquery.fancybox.pack
*= require _js/theme
*= require _js/modernizr
*= require _js/prettify
*= require _js/lang-go
*/

//**********************************
// CODE PRETTIFY
if($('.prettyprint').length) {
    window.prettyPrint && prettyPrint();
}

$(document).ready(function() {
        $(".fancybox").fancybox();
});
//**********************************