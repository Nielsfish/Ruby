module V1
  class GatesController < ApplicationController
    before_action :set_gate, only: %i[ show edit update destroy ]

    swagger_controller :gates, 'Gates'

    # GET /gates or /gates.json
    swagger_api :index do
      summary 'Returns all gates\' details'
    end
    def index
      @gates = Gate.all
      render json: @gates, status: :ok
    end

    # GET /gates/1 or /gates/1.json
    swagger_api :show do
      summary 'Returns a gate\'s details'
    end
    def show
      render json: @gate, status: :ok
    end

    # POST /gates or /gates.json
    swagger_api :create do
      summary 'Creates a gate'
      param :body, :body, :string, :required, "Request body"
    end
    def create
      @gate = Gate.new(gate_params)
      if @gate.save
        render json: @gate, status: :created
      else
        render json: @gate.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /gates/1 or /gates/1.json
    swagger_api :update do
      summary 'Updates a gate\'s details'
      param :path, :id, :integer, :required, "User ID"
      param :body, :body, :string, :required, "Request body"
      param :header, :Authorization, :string, :required, "Authentication bearer token"
    end
    def update

    end

    swagger_api :destroy do
      summary 'Deletes a gate'
      param :path, :id, :integer, :required, "User ID"
      param :header, :Authorization, :string, :required, "Authentication bearer token"
    end

    def destroy
      @gate.destroy
      render json: { "success": "true" }, status: :ok
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_gate
        @gate = Gate.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def gate_params
        params.require(:gate).permit(:gate_id, :user_id)
      end
  end
end

