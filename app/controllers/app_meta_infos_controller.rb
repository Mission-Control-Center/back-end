class AppMetaInfosController < ApplicationController
  def index
    @app_meta_infos = AppMetaInfo.all
    render json: @app_meta_infos
  end

  def create
    @app_meta_infos = AppMetaInfo.new(app_meta_infos_params)
    if @app_meta_infos.save
      render json: @app_meta_infos
    else
      render json: { 'Error': @app_meta_infos.errors.full_message }
    end
  end

  def update
    @app_meta_infos = AppMetaInfo.find_by(params[:id])
    if @app_meta_infos.update
      render json: @app_meta_infos
    else
      render json: { 'Error': @app_meta_infos.errors.full_message }
    end
  end
  
  def destroy
    @app_meta_infos = AppMetaInfo.find_by(params[:id])
    @app_meta_infos&.destroy
  end

  private 
  
  def app_meta_infos_params
    params.require(:app_meta_infos).permit(:name, :owner_id, :manager_id)
  end
end
