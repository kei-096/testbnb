class WelcomeController < ApplicationController
	def index
		@listing = Listing.order(:location).page params[:page]
	end
end
