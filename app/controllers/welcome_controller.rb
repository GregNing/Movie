class WelcomeController < ApplicationController
    def index
        flash[:alert] = "Successfully created..."
    end
end
