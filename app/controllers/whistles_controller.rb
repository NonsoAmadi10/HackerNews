class WhistlesController < ApplicationController
    before_action :logged_in_user

    def new
        @whistle = Whistle.new
        @community = Community.all
    end
    def create
        @whistle = Whistle.new(whistle_params)
        @whistle.user = current_user

        respond_to do |format|
            if @whistle.save
                format.html { redirect_to community_path(@whistle.community_id), notice: "Whistle Blown!"}
                format.js
            else
                format.html { redirect_to new_community_whistle_path, alert: "Error! Please try again #{@whistle.errors}" }
                format.js
            end
        end
    end

    private 
    def whistle_params
        params.require(:whistle).permit(:content, :title, :cover_image, :community_id, :community)
    end
end
