class ArrestsController < ApplicationController
  before_action :set_arrest, only: [:show, :update, :destroy]

  # GET /arrests
  def index
    @arrests = Arrest.all

    render json: @arrests
  end

  # GET /arrests/1
  def show
    render json: @arrest
  end

  # POST /arrests
  def create
    @arrest = Arrest.new(arrest_params)

    if @arrest.save
      render json: @arrest, status: :created, location: @arrest
    else
      render json: @arrest.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /arrests/1
  def update
    if @arrest.update(arrest_params)
      render json: @arrest
    else
      render json: @arrest.errors, status: :unprocessable_entity
    end
  end

  # DELETE /arrests/1
  def destroy
    @arrest.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arrest
      @arrest = Arrest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def arrest_params
      params.require(:arrest).permit(:state_id, :crime_id, :total_arrests, :male_arrests, :female_arrests, :year)
    end
end
