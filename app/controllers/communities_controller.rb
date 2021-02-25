class CommunitiesController < ApplicationController
    before_action :set_community, only: [:show]
    before_action :logged_in_user

    def new
        @community = current_user.communities.build
    end 

    def create 
        @community = current_user.communities.build(community_params)
        respond_to do |format|
            if @community.save
                format.html { redirect_to community_path(@community.id), notice: "Community Created!"}
                format.js
            else
                format.html { redirect_to new_community_path, alert: "Error! Please try again.#{@community.errors}" }
                format.js
            end
        end
    end 

    def index
        @community = Community.all.order("created_at DESC")
    end

    def show
    end

    private
    def set_community
        @community = Community.find(params[:id])
    end 
    def community_params
        params.require(:community).permit(:name)
    end
end
