class WhistlesController < ApplicationController
    before_action :logged_in_user
    before_action :set_whistle, only: %i[ show upvote downvote ]

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

    def show
    end

    def upvote
        @whistle.upvote_by current_user
        respond_to do |format|
            format.html { redirect_to whistle_path(@whistle.id), notice: "Whistle Liked"}
        end
    end

    def downvote 
        @whistle.downvote_by current_user
        redirect_to whistle_path(@whistle.id)
    end

    private 

     # Use callbacks to share common setup or constraints between actions.
    def set_whistle
        @whistle = Whistle.find(params[:id])
    end

    def whistle_params
        params.require(:whistle).permit(:content, :title, :cover_image, :community_id, :community)
    end
end
