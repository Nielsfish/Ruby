module V1
  class UsersController < ApplicationController

    swagger_controller :users, 'Users'

    # GET /users
    swagger_api :index do
      summary 'Returns all users\' details'
    end

    def index
      users = User.all
      render json: users, only:  [:id, :login, :first_name, :last_name, :account_type, :email, :account_no], status: :ok
    end

    # GET /users/1
    swagger_api :show do
      summary 'Returns an user\'s details'
      param :path, :id, :integer, :required, "User ID"
    end

    def show
      user = User.find(params[:id])
      render json: user, only:  [:id, :login, :first_name, :last_name, :account_type, :email, :account_no], status: :ok
    end

    # POST /users
    swagger_api :create do
      summary 'Creates an user'
      param :body, :body, :string, :required, "Request body"
    end

    def create
      user = User.new(user_params)
      if user.save
        render json: user, only:  [:id, :login, :first_name, :last_name, :account_type, :email, :account_no], status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    swagger_api :update do
      summary 'Updates an user\'s details'
      param :path, :id, :integer, :required, "User ID"
      param :body, :body, :string, :required, "Request body"
      param :header, :Authorization, :string, :required, "Authentication bearer token"
    end

    def update
      user = User.find(params[:id])
      if user.update(update_params)
        render json: user, only:  [:id, :login, :first_name, :last_name, :account_type, :email, :account_no], status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    swagger_api :destroy do
      summary 'Deletes an user'
      param :path, :id, :integer, :required, "User ID"
      param :header, :Authorization, :string, :required, "Authentication bearer token"
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      render json: { "success": "true" }, status: :ok
    end

    private
    def user_params
      params.permit(:login, :first_name, :last_name, :account_type, :email, :account_no, :password, :password_confirmation)
    end

    def update_params
      params.permit(:password, :password_confirmation, :nickname, :bio, :preferred_style)
    end

    def not_found
      render json: { "error": "not found" }, status: :not_found
    end

    def foreign_key_block
      render json: { "error": "foreign key in use" }, status: :internal_server_error
    end

    def unauthorized
      render json: { "error": "unauthorized or token expired" }, status: :unauthorized
    end
  end
end

