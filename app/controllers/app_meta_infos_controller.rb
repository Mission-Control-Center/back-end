class AppMetaInfosController < ApplicationController
  def index
    @app_meta_infos = AppMetaInfo.all
    render json: @app_meta_infos
  end

  def show
    @app_meta_info = AppMetaInfo.find_by(params[:id])
    if @app_meta_info
      render json: @app_meta_info
    else
      render json: { 'Error': 'AppMetaInfo not found' }
    end
  end

  def create
    @app_config = AppConfig.create(version: '1.0.0')
    @app_meta_info = AppMetaInfo.new(app_meta_info_params)
    @app_meta_info.app_config_id = @app_config.id
    if @app_meta_info.save
      render json: @app_meta_info
    else
      render json: { 'Error': @app_meta_info.errors.full_message }
    end
  end

  def update
    @app_meta_info = AppMetaInfo.find_by(params[:id])
    if @app_meta_info.update(app_meta_info_params)
      @app_config = AppConfig.find_by(id: @app_meta_info.app_config_id)
      @app_config.version = update_version(@app_config.version)
      @app_config.save
      render json: @app_config
    else
      render json: { 'Error': @app_meta_infos.errors.full_message }
    end
  end
  
  def destroy
    @app_meta_info = AppMetaInfo.find_by(params[:id])
    @app_meta_info&.destroy
  end

  private 
  
  def app_meta_info_params
    params.require(:app_meta_info).permit(:name, :owner_id, :manager_id)
  end

  def update_version(version)
    parts = version.split('.', -1)
    parts[0] = parts[0].to_i + 1
    parts.join('.')
  end
end
