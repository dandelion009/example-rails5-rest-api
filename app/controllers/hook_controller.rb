class HookController < ApplicationController
  before_action :authenticate_user
  before_action :set_hook, only: [:show, :update, :destroy]

  # GET /hooks
  def index
    @hooks = Hook.all

    render json: @hooks
  end

  # GET /hooks/:id
  def show
    render json: @hook
  end

  # POST /hooks
  def create
    @hook = Hook.new(hook_params)

    if @hook.save
      render json: @hook, status: :created, location: @hook
    else
      render json: @hook.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hooks/1
  def update
    if @hook.update(hook_params)
      render json: @hook
    else
      render json: @hook.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hooks/1
  def destroy
    @hook.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hook
      @hook = Hook.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hook_params
      params.fetch(:hook, {}).require(:threshold, :callback_url)
    end
end
