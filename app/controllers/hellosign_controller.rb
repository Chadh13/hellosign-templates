class HellosignController < ApplicationController

	def callbacks
		respond_to do |format|
			format.json { render text: 'Hello API Event Received', status: 200 }
		end
	end

end