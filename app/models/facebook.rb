class Facebook
	attr_reader :fb_graph

	def initialize(token)
		@fb_graph = FbGraph::User.me(token)
	end


	def post event, url
		post = {
			message: 'Acabei de criar um novo evento no EventsBrazil não deixe de conferir',
		  link: url,
		  picture: event.photo.url(:original, timestamp: false),	
		  name: event.title,
		  description: event.description
		}
		@fb_graph.feed!(post)
	end

end