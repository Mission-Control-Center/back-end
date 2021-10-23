class RolesController < ApplicationController
  def index
    @roles = Role.all
    render json: @roles
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      render json: @role
    else
      render json: { 'Error': @role.errors.full_message }
    end
  end

  def update
    @role = Role.find_by(params[:id])
    if @role.update
      render json: @role
    else
      render json: { 'Error': @role.errors.full_message }
    end
  end
  
  def destroy
    @role = Role.find_by(params[:id])
    @role&.destroy
  end

  private 
  
  def role_params
    params.require(:role).permit(:name)
  end
end
