module V1
  class PositionsController < ApplicationController
    before_action :set_position, only: %i[ show edit update destroy ]

    swagger_controller :positions, 'Positions'

    # GET /positions or /positions.json
    swagger_api :index do
      summary 'Returns all positions\' details'
    end

    def index
      @positions = Position.all
    end

    # GET /positions/1 or /positions/1.json
    swagger_api :show do
      summary 'Returns a position\'s details'
      param :path, :id, :integer, :required, "User ID"
    end

    def show
      @position = Position.find(params[:id])
    end

    # POST /positions or /positions.json
    swagger_api :create do
      summary 'Creates a position'
      param :body, :body, :string, :required, "Request body"
    end

    def create
      @position = Position.new(position_params)

      if @position.save
        render :show, status: :created, location: @position
      else
        render json: @position.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /positions/1 or /positions/1.json
    swagger_api :update do
      summary 'Updates a position\'s details'
      param :path, :id, :integer, :required, "User ID"
      param :body, :body, :string, :required, "Request body"
      param :header, :Authorization, :string, :required, "Authentication bearer token"
    end

    def update
      if @position.update(position_params)
        render :show, status: :ok, location: @position
      else
        render json: @position.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    swagger_api :destroy do
      summary 'Deletes a position '
      param :path, :id, :integer, :required, "User ID"
      param :header, :Authorization, :string, :required, "Authentication bearer token"
    end

    def destroy
      @position.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_position
        @position = Position.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def position_params
        params.require(:position).permit(:position_id, :position_name, :salary)
      end
  end
end

