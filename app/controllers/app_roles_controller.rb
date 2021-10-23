class AppRolesController < ApplicationController
  def index
    @app_roles = AppRole.all
    render json: @app_roles
  end

  def show
    @app_role = AppRole.find_by(params[:id])
    if @app_role
      render json: @app_role
    else
      render json: { 'Error': 'AppRole not found' }
    end
  end

  def create
    @app_role = AppRole.new(app_role_params)
    if @app_role.save
      @app_config = AppConfig.find_by_id(@app_role.app_config_id)
      @app_config.version = update_version(@app_config.version)
      @app_config.save
      render json: @app_role
    else
      render json: { 'Error': @app_role.errors.full_message }
    end
  end

  def update
    @app_role = AppRole.find_by(params[:id])
    if @app_role.update(app_role_params)
      render json: @app_role
    else
      render json: { 'Error': @app_role.errors.full_message }
    end
  end
  
  def destroy
    @app_role = AppRole.find_by(params[:id])
    if @app_role
      @app_config = AppConfig.find_by_id(@app_role.app_config_id)
      @app_config.version = update_version(@app_config.version)
      @app_config.save
      @app_role.destory
      render json: { 'Success': 'App Role deleted and Config version updated' }
    else
      render json: { 'Failure': 'AppRole not found' }
    end
  end

  private 
  
  def app_role_params
    params.require(:app_role).permit(:role_id, :app_config_id)
  end

  def update_version(version)
    parts = version.split('.', -1)
    parts[2] = parts[2].to_i + 1
    parts.join('.')
  end
end
  