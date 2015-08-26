jQuery(document).ready(function(){
  jQuery('#eventModal').modal('show');
});

$(document).on("upload:start", "form", function(e){
	$(this).find("input[type=submit]").attr "disabled", true
});
  

$(document).on("upload:complete", "form", function(e){
	$(this).find("input[type=submit]").removeAttr "disabled"  unless $(this).find("input.uploading").length
});
  