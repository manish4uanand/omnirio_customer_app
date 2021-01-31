class V1::RolesController < ApplicationController
  def index
    @roles = Role.all

    render json: @roles, status: :ok
  end

  def create
    @role = Role.new(role_params)
    @role.save

    render json: @role, status: :created
  end

  private

  def role_params
    params.require(:role).permit(:role_code, :role_name)
  end

end
