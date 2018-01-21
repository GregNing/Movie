class Account::MoviegroupsController < ApplicationController
    before_action :authenticate_user!, only: [:index]
    before_action :find_moviegruops_id, :only => [:index]
    
    def index
            
    end

    private
    def find_moviegruops_id
        @groups = current_user.participated_moviegroups
    end
end
