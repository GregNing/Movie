class MoviegroupsController < ApplicationController
    before_action :find_moviegroups_id, :only => [:destroy, :edit, :update]
    before_action :authenticate_user!, only: [:new,:edit,:update,:destroy, :join, :quit]
    def index
        @groups = Moviegroup.all
    end

    def new
        @group = Moviegroup.new
    end

    def create
        @group = Moviegroup.new(moviegroup_params)
        @group.user = current_user
        if @group.save
            current_user.join!(@group)
            redirect_to moviegroups_path, notice: "#{@group.title}新增成功!"
        else
            render :new
        end 
    end

    def show
        @group = Moviegroup.find(params[:id])
        @posts = @group.reviews.recent.paginate(:page => params[:page], :per_page => 5)
    end

    def edit
        
    end

    def update
        if @group.update(moviegroup_params)
            redirect_to moviegroup_path(@group), notice: "#{@group.title}修改成功!"
        else
            render :edit
        end
    end

    def destroy
        @group.destroy
        flash[:alert] = "#{@group.title}刪除成功!"
        redirect_to moviegroups_path
    end

    def join
        @group = Moviegroup.find(params[:id])
        if !current_user.is_member_of?(@group)
            current_user.join!(@group)
            flash[:notice] = "加入#{@group.title}成功!"
        else            
            flash[:warning] = "你已經是#{@group.title}群組了!"
        end        
        redirect_to moviegroup_path(@group)
    end

    def quit
        @group = Moviegroup.find(params[:id])            
        if current_user.is_member_of?(@group)
            current_user.quit!(@group)
            flash[:alert] = "你已退出#{@group.title}!"
        else
            flash[:warning] = "你已不在#{@group.title}群組!"
        end
        redirect_to moviegroup_path(@group)
    end

    private
    def find_moviegroups_id
        @group = Moviegroup.find(params[:id])
        if current_user != @group.user
        redirect_to root_path, alert: "尚無權限進行修改動作!"
    end
    end

    def moviegroup_params
        params.require(:moviegroup).permit(:title, :description)
    end
end
