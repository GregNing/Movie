class Moviegroup < ApplicationRecord
    belongs_to :user
    has_many :reviews , dependent: :destroy
    validates :title, :description, presence: true

    has_many :moviegroup_relationships
    has_many :members, through: :moviegroup_relationships, source: :user
end
