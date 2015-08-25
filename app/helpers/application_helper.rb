module ApplicationHelper
	def facebook_share
		html = <<-HTML 
			<meta property="og:url"           content="#{ event_url(@event) }" />
	    <meta property="og:type"          content="website" />
	    <meta property="og:title"         content="#{ @event.title }" />
	    <meta property="og:description"   content="#{ @event.description }" />
	    <meta property="og:image"         content="#{ @event.photo.url }" />
		HTML
		if @event
		 html.html_safe
		end
	end
end
