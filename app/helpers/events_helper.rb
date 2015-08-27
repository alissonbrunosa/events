module EventsHelper
	def share_button event
		html = <<-HTML
			<div class="col-md-12">
        <ul class="social-network social-circle">
          <li>
            <a href="http://www.facebook.com/sharer/sharer.php?s=100&p[url]=#{event_url(event)}&p[images][0]=#{event.photo.url(:original)}&p[title]=#{event.title}&p[summary]=#{event.description}" class="icoFacebook b-share-button bg" title="Facebook" target="_blank"><i class="fa fa-facebook"></i></a>
          </li>
          <li>
            <a href="http://twitter.com/intent/tweet?status=Não deixe de participar+#{event_url(event)}" class="icoTwitter bg" title="Twitter" target="_blank"><i class="fa fa-twitter"></i></a></li>
        </ul>       
      </div>
		HTML
		html.html_safe
	end
end
