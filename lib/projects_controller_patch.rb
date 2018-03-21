module RedmineAmp
  module ProjectsControllerPatch
    def show
      begin
        return super
      rescue ActionController::UnknownFormat => e
        if params[:format] != 'amp'
          raise e
        end
      end

      render :template => 'projects/show.amp', :layout => 'amp'
    end
  end
end
