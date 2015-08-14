class HellosignController < ApplicationController

	def callbacks
		HelloSignEvent.new(params[:json])
		respond_to do |format|
			format.json { render json: 'Hello API Event Received', status: 200 }
		end
	end

end