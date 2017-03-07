class BrandsController < ApplicationController
  before_action :authenticate_user
  before_action :set_brand, only: [:show, :update, :destroy, :followers]

  # GET /brands
  def index
    @brands = Brand.all

    render json: @brands
  end

  # GET /brands/:id/followers
  def followers
    @followers = @brand.followers

    render json: @followers, except: [:created_at, :updated_at]
  end

  # GET /brands/1
  def show
    render json: @brand
  end

  # POST /brands
  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      render json: @brand, status: :created, location: @brand
    else
      render json: @brand.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /brands/1
  def update
    if @brand.update(brand_params)
      render json: @brand
    else
      render json: @brand.errors, status: :unprocessable_entity
    end
  end

  # DELETE /brands/1
  def destroy
    @brand.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      brand_id = params[:brand_id] || params[:id]
      @brand = Brand.find(brand_id)
    end

    # Only allow a trusted parameter "white list" through.
    def brand_params
      params.permit(:name, follower_ids: [])
    end
end
