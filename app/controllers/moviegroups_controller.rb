class MoviegroupsController < ApplicationController
    def index
        @groups = Moviegroup.all
    end
end
