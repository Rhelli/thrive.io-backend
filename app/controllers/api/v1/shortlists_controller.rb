class ShortlistsController < ApplicationController
  def user_index
    @shortlists = Shortlist.user_likes(current_user.id)
    if @shortlists
      render json: @shortlist, each_serializer: ShortlistSerializer
    else
      render json: { status: 500, errors: ['No shortlists found. Please try again later.'] }
    end
  end

  def property_index
    @shortlists = Shortlist.property_likes(id: shortlist_params[:id])
    if @shortlists
      render json: @shortlist, each_serializer: ShortlistSerializer
    else
      render json: { status: 500, errors: ['No shortlists found. Please try again later.'] }
    end
  end

  def create
    @shortlist = Shortlist.create!(shortlist_params)
    if @shortlist.valid?
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
    @shortlist = Shortlist.find(shortlist_params[:id])
    if @shortlist.destroy!
      render json: { message: 'Shortlist deleted.' }, status: :ok
    else
      render json: { status: 500, errors: ['Something went wrong! Please try again later.'] }
    end
  end
end
