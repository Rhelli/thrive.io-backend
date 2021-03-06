class Api::V1::PropertiesController < ApplicationController
  skip_before_action :authorized, only: %i[index show]

  def index
    @properties = Property.all
    if @properties
      render json: @properties, each_serializer: PropertySerializer
    else
      render json: { status: 500, errors: ['Properties not found.'] }
    end
  end

  def advertiser_index
    @properties = Property.owned_properties(current_user)
    if @properties
      render json: @properties, each_serializer: PropertySerializer
    else
      render json: { status: 500, error: ['No Properties Found'] }
    end
  end

  def create
    @property = Property.create!(property_params)
    if @property.valid?
      render json: { property: PropertySerializer.new(@property) }, status: :created
    else
      render json: { errors: ['Failed to create property! Please try again.'] }, status: :not_acceptable
    end
  end

  def show
    @property = Property.find(property_params[:id])
    if @property
      render json: { property: @property }
    else
      render json: { status: 500, errors: ['Property not found!'] }
    end
  end

  def update
    @property = Property.find(property_params[:id])
    if @property.update!(property_params)
      render json: @property
    else
      render json: { status: 500, errors: ['Something went wrong. Please try again later.'] }
    end
  end

  def destroy
    @property = Property.find(property_params[:id])
    if @property.destroy
      render json: { message: 'Property deleted.' }, status: :ok
    else
      render json: { status: 500, errors: ['Something went wrong. Please try again later.'] }
    end
  end

  def multiple_destroy
    @properties = current_user.properties
    if @properties.destroy_all
      render json: { message: 'All properties have been removed.' }, status: :ok
    else
      render json: { status: 500, errors: ['Something went wrong. Please try again later.'] }
    end
  end

  private

  def property_params
    params.require(:property).permit(
      :id, :owner_id, :title, :user_type, :images, :blurb, :type, :address, :postcode, :price, :deposit, :bills,
      :furnished, :parking, :disabled_access, :internet, :occupant_count, :room_count,
      :min_age, :max_age, :smoking, :town, pets: [], genders: [], occupations: [], outside_area: []
    )
  end
end
