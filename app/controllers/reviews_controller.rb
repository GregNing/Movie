class ReviewsController < ApplicationController    
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] 
    before_action :find_movie_group_id, only: [:new, :create]
    before_action :find_review_id, only: [:edit, :update, :destroy]
    def new        
        if current_user && !current_user.is_member_of?(@group)
            redirect_to root_path
        end
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

    def edit
        
    end

    def update
        if current_user && current_user == @post.user && 
            @post.update(review_params)            
            flash[:notice] = "更新#{@group.title}評論成功"
            redirect_to account_reviews_path
        else
            render :edit
        end        
    end

    def destroy
        if current_user && current_user == @post.user
            @post.destroy
            flash[:notice] = "刪除#{@group.title}評論成功"
            redirect_to account_reviews_path
        else
            render :edit
        end        
    end

    private
    def review_params
        params.require(:review).permit(:content)
    end

    def find_review_id
        @post = Review.find(params[:id])
        @group = Moviegroup.find(@post.moviegroup_id)
    end

    def find_movie_group_id
        @group = Moviegroup.find(params[:moviegroup_id])
    end
end
