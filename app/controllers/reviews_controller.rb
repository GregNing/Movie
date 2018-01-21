class ReviewsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]    
    before_action :find_movie_group_id, :only => [:new, :create]
    
    def new
        @post = Review.new     
    end
    def create
        @post = Review.new(review_params)
        @post.moviegroup = @group
        @post.user = current_user

        if @post.save
            redirect_to moviegroup_path(@group), notice: "#{@group.title}評論成功"
        else
            render :new
        end

    end
    private
    def review_params
        params.require(:review).permit(:content)
    end

    def find_movie_group_id
        @group = Moviegroup.find(params[:moviegroup_id])
    end
end
