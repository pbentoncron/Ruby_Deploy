class LikesController < ApplicationController
    def create
        idea = Idea.find(params['idea_id'])
        like = Like.create(user: current_user, idea: idea)
        redirect_to :back
    end

    private
        def likes_params
            params.require(:likes).permit(:user_id, :idea_id)
        end
end
