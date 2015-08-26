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

