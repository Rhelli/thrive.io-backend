class Api::V1::ShortlistsController < ApplicationController
  def user_index
    @shortlists = current_user.shortlisted_properties
    if @shortlists
      render json: @shortlist, each_serializer: ShortlistSerializer
    else
      render json: { status: 500, errors: ['No shortlists found. Please try again later.'] }
    end
  end

  def property_index
    @property = Property.find(shortlist_params)
    @shortlists = Property.user_likes
    if @shortlists
      render json: @shortlist, each_serializer: ShortlistSerializer
    else
      render json: { status: 500, errors: ['No shortlists found. Please try again later.'] }
    end
  end

  def create
    @shortlist = current_user.shortlists.build(property_id: shortlist_params[:property_id])
    if @shortlist.save
      render json: { shortlist: ShortlistSerializer.new(@shortlist) }, status: :created
    else
      render json: { errors: ['Failed to create shortlist. Please try again.'] }, status: :not_acceptable
    end
  end

  def show
    @shortlist = Shortlist.find(shortlist_params[:id])
    if @shortlist
      render json: { shortlist: @shortlist }
    else
      render json: { status: 500, errors: ['Shortlist not found! Please try again later'] }
    end
  end

  def destroy
    @shortlist = Shortlist.find_by(property_id: shortlist_params[:property_id])
    if @shortlist.destroy!
      render json: { message: 'Shortlist deleted.' }, status: :ok
    else
      render json: { status: 500, errors: ['Something went wrong! Please try again later.'] }
    end
  end

  private

  def shortlist_params
    params.require(:shortlist).permit(:id, :user_id, :property_id)
  end
end
