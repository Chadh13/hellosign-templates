class HelloSignEvent
	attr_reader :json

	def intiailize(json = nil)
		@json = JSON.parse(json)
	end

end