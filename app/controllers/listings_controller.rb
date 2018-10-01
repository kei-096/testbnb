class ListingsController < ApplicationController
  def index
    @listings = Listing.where(user_id: params['user_id'])
  end

  def search
    @listings = Listing.where(nil)
    @listings = @listings.where("location LIKE ?", search_params['location']) if search_params['location'].present?
    @listings = @listings.where(room_type: search_params['room_type']) if search_params['room_type'].present?
    @listings = @listings.where(guest: search_params['guest']) if search_params['guest'].present?
  end

  def autocomplete
    @locations = Listing.search_location(search_params['location'])
    respond_to do |format|
      format.json { render json: @locations }
      format.js
    end
  end

  def new
    # allowed?(action: @listing = Listing.new, user: current_user)
    @listing = Listing.new
    
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
  end

  def create
    @listing = current_user.listings.new(listing_params)

    if @listing.save
      redirect_to listing_path(@listing)
    else
      redirect_to new_listing_path
    end
  end

  def destroy
  end

  private
  def listing_params
    params.require(:listing).permit(:user_id, :location, :guest, :room_type, images: [])
  end

  def search_params
    params.require(:listing).permit(:location, :room_type, :guest)
  end
end
