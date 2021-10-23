class PermissionsController < ApplicationController
  def index
    @permissions = Permission.all
    render json: @permissions
  end

  def show
    @permission = Permission.find_by(params[:id])
    if @permission
      render json: @permission
    else
      render json: { 'Error': 'Permission not found' }
    end
  end

  def create
    @permission = Permission.new(permission_params)
    if @permission.save
      render json: @permission
    else
      render json: { 'Error': @permission.errors.full_message }
    end
  end

  def update
    @permission = Permission.find_by(params[:id])
    if @permission.update(permission_params)
      render json: @permission
    else
      render json: { 'Error': @permission.errors.full_message }
    end
  end
  
  def destroy
    @permission = Permission.find_by(params[:id])
    @permission&.destroy
  end

  private 
  
  def permission_params
    params.require(:permission).permit(:name)
  end
end
