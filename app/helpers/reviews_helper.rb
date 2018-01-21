module ReviewsHelper
    def render_reviews_content(reviews)
        simple_format(reviews.content)
    end
end
