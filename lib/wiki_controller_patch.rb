module RedmineAmp
  module WikiControllerPatch
    def show
      begin
        return super
      rescue ActionController::UnknownFormat => e
        if params[:format] != 'amp'
          raise e
        end
      end

      render :template => 'wiki/show.amp', :layout => 'amp'
    end
  end
end
