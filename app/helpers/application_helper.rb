module ApplicationHelper
	def facebook_share
		html = if @event && action_name == "show"
			<<-HTML 
				<meta property="og:url"           content="#{ event_url(@event) }" />
		    <meta property="og:type"          content="website" />
		    <meta property="og:title"         content="#{ @event.title }" />
		    <meta property="og:description"   content="#{ @event.description }" />
		    <meta property="og:image"         content="#{ @event.photo.url(:original, timestamp: false) }" />
		    <meta name="description"					content="#{ @event.description}" />
			HTML
		else
			<<-HTML 
				<meta property="og:image" content="#{ asset_url 'logo.png' }" />
			  <meta property="og:title" content="Events Brazil" />
			  <meta property="og:site_name" content="Events Brazil"/>
			  <meta property="og:url" content="#{ root_url }" />
			  <meta property="og:type" content="website" />
			  <meta property="og:description" content="Site feito com o intuito de compartilhar eventos na área de TI em todo território brasileiro. " />
			  <meta property="og:locale" content="pt_BR" />
			  <meta name="description" content="Site feito com o intuito de compartilhar eventos na área de TI em todo território brasileiro. " />
		  HTML
		end
		html.html_safe
	end
end
