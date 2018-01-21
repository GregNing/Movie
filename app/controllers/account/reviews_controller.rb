class Account::ReviewsController < ApplicationController
    before_action :authenticate_user!, only: [:index]
    def index
        @posts = current_user.reviews.recent
    end
end
