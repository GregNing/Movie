class MoviegroupsController < ApplicationController
    before_action :find_moviegroups_id, :only => [:destroy, :show, :edit, :update]
    def index
        @groups = Moviegroup.all
    end

    def new
        @group = Moviegroup.new
    end

    def create
        @group = Moviegroup.new(moviegroup_params)

        if @group.save
            redirect_to moviegroups_path, notice: "#{@group.title}新增成功!"
        else
            render :new
        end 
    end

    def show
        
    end

    def edit
        
    end

    def update
        if @group.update(moviegroup_params)
            redirect_to moviegroups_path, notice: "#{@group.title}修改成功!"
        else
            render :edit
        end
    end

    def destroy
        @group.destroy
        flash[:alert] = "#{@group.title}刪除成功!"
        redirect_to moviegroups_path
    end
    private
    def find_moviegroups_id
        @group = Moviegroup.find(params[:id])
    end

    def moviegroup_params
        params.require(:moviegroup).permit(:title, :description)
    end
end
