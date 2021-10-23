class RolePermissionsController < ApplicationController
  def index
    @role_permissions = RolePermission.all
    render json: @role_permissions
  end

  def show
    @role_permission = RolePermission.find_by(params[:id])
    if @role_permission
      render json: @role_permission
    else
      render json: { 'Error': 'RolePermission not found' }
    end
  end

  def create
    @role_permission = RolePermission.new(role_permission_params)
    if @role_permission.save
      render json: @role_permission
    else
      render json: { 'Error': @role_permission.errors.full_message }
    end
  end

  def update
    @role_permission = RolePermission.find_by(params[:id])
    if @role_permission.update(role_permission_params)
      render json: @role_permission
    else
      render json: { 'Error': @role_permission.errors.full_message }
    end
  end
  
  def destroy
    @role_permission = RolePermission.find_by(params[:id])
    @role_permission&.destroy
  end

  private 
  
  def role_permission_params
    params.require(:role_permission).permit(:role_id, :permission_id)
  end
end
