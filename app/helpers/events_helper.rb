module EventsHelper
	def share_button event
		html = <<-HTML
			<div class="col-md-12">
        <ul class="social-network social-circle">
          <li>
            <a href="https://www.facebook.com/dialog/feed?app_id=168897073442603&link=#{event_url(event)}&picture=#{event.photo.url(:original, timestamp: false)}&display=popup&name=#{event.title}&description=#{event.description}&caption=#{root_url}&redirect_uri=#{event_url(event)}" class="icoFacebook b-share-button bg" title="Facebook"><i class="fa fa-facebook"></i></a>
          </li>
          <li>
            <a href="http://twitter.com/intent/tweet?status=Não deixe de participar+#{event_url(event)}" class="icoTwitter bg" title="Twitter" target="_blank"><i class="fa fa-twitter"></i></a></li>
        </ul>       
      </div>
		HTML
		html.html_safe
	end
end
