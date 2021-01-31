module V1
  class UsersController < ApplicationController
    def create
      user = User.new(user_params)
      if user.save
        render json: user, status: :ok
      else
        head(:unprocessible_entity)
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :user_name, :date_of_birth, :gender, :phone_number, :password, :password_confirmation, :role_id)
    end
  end
end
