class DhtsController < ApplicationController
  before_action :set_dht, only: [:show, :update, :destroy]

  # GET /dhts
  def index
    @dhts = Dht.all

    render json: @dhts
  end

  # GET /dhts/1
  def show
    render json: @dht
  end

  # POST /dhts
  def create
    @dht = Dht.new(dht_params)
    if @dht.save
      render json: @dht, status: :created, location: @dht
    else
      render json: @dht.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dhts/1
  def update
    if @dht.update(dht_params)
      render json: @dht
    else
      render json: @dht.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dhts/1
  def destroy
    @dht.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dht
      @dht = Dht.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dht_params
      params.require(:dht).permit(:name, :temperature, :humidity)
    end
end
