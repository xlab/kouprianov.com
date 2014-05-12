/* theme.js
 * Custom javascript
 * ------------------------------------------------------------------ */
// Add indexOf support for IE

if (!Array.prototype.indexOf)
{
  Array.prototype.indexOf = function(elt /*, from*/)
  {
    var len = this.length >>> 0;

    var from = Number(arguments[1]) || 0;
    from = (from < 0)
         ? Math.ceil(from)
         : Math.floor(from);
    if (from < 0)
      from += len;

    for (; from < len; from++)
    {
      if (from in this &&
          this[from] === elt)
        return from;
    }
    return -1;
  };
}

//Smooth Scrolling
jQuery(function(){
    jQuery('a[href*=#]').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'')
        && location.hostname == this.hostname) {
            var jQuerytarget = jQuery(this.hash);
            jQuerytarget = jQuerytarget.length && jQuerytarget || jQuery('[name=' + this.hash.slice(1) +']');
            if (jQuerytarget.length) {
                var targetOffset = jQuerytarget.offset().top;
                jQuery('html,body').animate({scrollTop: targetOffset}, 1000);
                return false;
            }
        }
    });
});

// Temporarily added to remove touch gestures for iOS6
function ttfGetOsVersion() {
	var agent = window.navigator.userAgent,
		start = agent.indexOf( 'OS ' );

	if( ( agent.indexOf( 'iPhone' ) > -1 || agent.indexOf( 'iPad' ) > -1 ) && start > -1 ){
		return window.Number( agent.substr( start + 3, 3 ).replace( '_', '.' ) );
	} else {
		return 0;
	};

};

// We only want to use touch controls on non-iOS6 browsers
var ttfUseTouchControls = ( ttfGetOsVersion() < 6.0 );
