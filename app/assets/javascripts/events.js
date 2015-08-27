jQuery(document).ready(function(){
  jQuery('#eventModal').modal('show');

  jQuery(".event_image_original").fancybox({
  	openEffect : 'none',
  	closeEffect	: 'none',
  	helpers : {
  		title : {
  			type : 'outside'
  		}
  	}
  });
});

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '168897073442603',
      xfbml      : true,
      version    : 'v2.4'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));