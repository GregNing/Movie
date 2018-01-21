class Moviegroup < ApplicationRecord
validates :title, :description, presence: true
end
