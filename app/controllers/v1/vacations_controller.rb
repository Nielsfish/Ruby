module V1
  class VacationsController < ApplicationController
    before_action :set_vacation, only: %i[ show edit update destroy ]

    swagger_controller :vacations, 'Vacations'

    # GET /vacations or /vacations.json
    swagger_api :index do
      summary 'Returns all vacations\' details'
    end

    def index
      @vacations = Vacation.all
      render json: @vacations, status: :ok
    end

    # GET /vacations/1 or /vacations/1.json
    swagger_api :show do
      summary 'Returns a vacation\'s details'
      param :path, :id, :integer, :required, "User ID"
    end

    def show
      render json: @vacation, status: :ok
    end

    # GET /vacations/new
    swagger_api :create do
      summary 'Creates a vacation'
      param :body, :body, :string, :required, "Request body"
    end

    # POST /vacations or /vacations.json
    def create
      @vacation = Vacation.new(vacation_params)
      if @vacation.save
        render json: @vacation, status: :created
      else
        render json: @vacation.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /vacations/1 or /vacations/1.json
    swagger_api :update do
      summary 'Updates a vacation\'s details'
      param :path, :id, :integer, :required, "User ID"
      param :body, :body, :string, :required, "Request body"
      param :header, :Authorization, :string, :required, "Authentication bearer token"
    end

    def update
      @vacation = Vacation.new(vacation_params)
      if @vacation.save
        render json: @vacation, status: :created
      else
        render json: @vacation.errors, status: :unprocessable_entity
      end
    end

    # DELETE /vacations/1 or /vacations/1.json
    swagger_api :destroy do
      summary 'Deletes a vacation'
      param :path, :id, :integer, :required, "User ID"
      param :header, :Authorization, :string, :required, "Authentication bearer token"
    end

    def destroy
      @vacation.destroy
      render json: { message: 'Successfully deleted' }, status: :ok
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_vacation
        @vacation = Vacation.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def vacation_params
        params.require(:vacation).permit(:vacation_id, :employee_id, :start_date, :end_date, :vacation_type, :decision)
      end
  end
end

