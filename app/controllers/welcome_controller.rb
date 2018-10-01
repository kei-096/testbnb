class WelcomeController < ApplicationController
	def index
		@listings = Listing.order(:location).page params[:page]
		@listing = Listing.new
	end
end
