class ListingsController < ApplicationController
  def index
    @listings = Listing.where(user_id: params['user_id'])
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
end
