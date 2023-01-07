module V1
=begin
  class SessionsController < ApplicationController

    swagger_controller :sessions, 'Session'

    def new
    end

    def create
      user = User.find_by(login: params[:session][:login])
      if user && user.authenticate(params[:session][:password])
        # Wszystko dobrze, logujemy
        log_in user
        redirect_to user
      else
        # Niedobrze
        render 'new'
      end
    end

    def destroy
      log_out
      redirect_to root_url
    end
  end
end
=end

  class SessionsController < ApplicationController

    swagger_controller :sessions, 'Session'

    # POST /login
    swagger_api :login do
      summary 'Returns a token'
      param :body, :body , :string, :required, "Request body"
    end
    def login
      user = User.find_by_login(params[:login])
      if user && user.authenticate(params[:password])
        token = jwt_encode(artist_id: user.id)
        render json: { "token": token }, status: :ok
      else
        render json: { "error": "incorrect credentials" }, status: :unauthorized
      end
    end
  end
end
