class IdeasController < ApplicationController
    before_action :require_login, only: [:index, :create, :destroy]
    
    def index
        @user = current_user
        @idea = User.find(@user.id).ideas
        @ideas = Idea.all
    end

    def create
        @user = current_user
        @idea = User.find(@user.id).ideas
        idea = current_user.ideas.create(ideas_params)
        redirect_to ideas_path
    end

    def destroy
        @user = current_user
        idea = Idea.find(params[:id])
        idea.destroy if idea.user == current_user
        redirect_to ideas_path
    end

    def show
        @ideas = Idea.find(params[:id])
    end

    private
        def ideas_params
            params.require(:idea).permit(:content, :user_id)
        end
end
