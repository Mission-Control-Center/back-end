class AppConfigsController < ApplicationController
  def index
    @app_configs = AppConfig.all
    render json: @app_configs
  end

  def create
    @app_config = AppConfig.new(app_config_params)
    if @app_config.save
      render json: @app_config
    else
      render json: { 'Error': @app_config.errors.full_message }
    end
  end

  def update
    @app_config = AppConfig.find_by(params[:id])
    if @app_config.update
      render json: @app_config
    else
      render json: { 'Error': @app_config.errors.full_message }
    end
  end
  
  def destroy
    @app_config = AppConfig.find_by(params[:id])
    if @app_config
      @app_config&.is_deleted = true
      @app_config&.save
      render json: { 'Success': 'app_config deleted' }
    else
      render json: { 'Failure': 'app_config not found' }
    end
  end

  def restore
    @app_config = AppConfig.find_by(params[:id])
    if @app_config
      @app_config&.is_deleted = false
      @app_config&.save
      render json: { 'Success': 'app_config restored', 'config': @app_config }
    else
      render json: { 'Failure': 'app_config not found' }
    end
  end

  private 
  
  def app_config_params
    params.require(:app_config).permit(:version)
  end
end