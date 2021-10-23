class AppRolesController < ApplicationController
    def index
      @app_roles = AppRole.all
      render json: @app_roles
    end
  
    def create
      @app_role = AppRole.new(app_role_params)
      if @app_role.save
        render json: @app_role
      else
        render json: { 'Error': @app_role.errors.full_message }
      end
    end
  
    def update
      @app_role = AppRole.find_by(params[:id])
      if @app_role.update
        render json: @app_role
      else
        render json: { 'Error': @app_role.errors.full_message }
      end
    end
    
    def destroy
      @app_role = AppRole.find_by(params[:id])
      if @app_role
        @app_role&.is_deleted = true
        @app_role&.save
        render json: { 'Success': 'app_role deleted' }
      else
        render json: { 'Failure': 'app_role not found' }
      end
    end
  
    def restore
      @app_role = AppRole.find_by(params[:id])
      if @app_role
        @app_role&.is_deleted = false
        @app_role&.save
        render json: { 'Success': 'app_role restored', 'config': @app_role }
      else
        render json: { 'Failure': 'app_role not found' }
      end
    end
  
    private 
    
    def app_role_params
      params.require(:app_role).permit(:version)
    end
  end
  