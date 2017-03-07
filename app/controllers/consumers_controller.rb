class ConsumersController < ApplicationController
  before_action :authenticate_user
  before_action :set_consumer, only: [:show, :update, :destroy, :brand_affinities]

  # GET /consumers
  def index
    @consumers = Consumer.includes(:brand_affinities)

    render json: @consumers
  end

  # GET /consumers/:consumer_id/brand_affinities
  def brand_affinities
    @brand_affinities = @consumer.brand_affinities

    render json: @brand_affinities, except: [:created_at, :updated_at]
  end

  # GET /consumers/1
  def show
    render json: @consumer
  end

  # POST /consumers
  def create
    @consumer = Consumer.new(consumer_params)

    if @consumer.save
      render json: @consumer, status: :created, location: @consumer
    else
      render json: @consumer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /consumers/1
  def update
    if @consumer.update(consumer_params)
      render json: @consumer
    else
      render json: @consumer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /consumers/1
  def destroy
    @consumer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumer
      consumer_id = params[:consumer_id] || params[:id]
      @consumer = Consumer.find(consumer_id)
    end

    # Only allow a trusted parameter "white list" through.
    def consumer_params
      params.permit(:name, brand_affinity_ids: [])
    end
end
