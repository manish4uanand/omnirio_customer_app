class V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user&.valid_password?(params[:password])

      # These things will go inside configuration file
      jwt_token = JWT.encode(
        { user_id: user.id, exp: (Time.now + 2.weeks).to_i},
        Rails.application.secrets.secret_key_base,
        'HS256'
      )
      render json: { token: jwt_token }, status: :created
    else
      render json: { error: 'invalid credentials' }, status: :unauthorized
    end
  end
end