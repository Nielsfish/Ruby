module V1
  class ManagersController < ApplicationController
    before_action :set_manager, only: %i[ show edit update destroy ]

    swagger_controller :managers, 'Managers'

    # GET /managers or /managers.json
    swagger_api :index do
      summary 'Returns all managers\' details'
    end
    def index
      @managers = Manager.all
      render json: @managers
    end

    # GET /managers/1 or /managers/1.json
    swagger_api :show do
      summary 'Returns  manager\'s details'
      param :path, :id, :integer, :required, "User ID"
    end
    def show
      render json: @manager, status: :ok
    end

    # POST /managers or /managers.json
    swagger_api :create do
      summary 'Creates a manager'
      param :body, :body, :string, :required, "Request body"
    end
    def create
      @manager = Manager.new(manager_params)

      if @manager.save
        render :show, status: :created, location: @manager
      else
        render json: @manager.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /managers/1 or /managers/1.json
    swagger_api :update do
      summary 'Updates a manager\'s details'
      param :path, :id, :integer, :required, "User ID"
      param :body, :body, :string, :required, "Request body"
      param :header, :Authorization, :string, :required, "Authentication bearer token"
    end
    def update
      if @manager.update(manager_params)
        render :show, status: :ok, location: @manager
      else
        render json: @manager.errors, status: :unprocessable_entity
      end
    end

    # DELETE /managers/1
    swagger_api :destroy do
      summary 'Deletes a manager'
      param :path, :id, :integer, :required, "User ID"
      param :header, :Authorization, :string, :required, "Authentication bearer token"
    end

    def destroy
      @manager.destroy
      head :no_content
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_manager
        @manager = Manager.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def manager_params
        params.permit(:user_id)
      end
  end
end

