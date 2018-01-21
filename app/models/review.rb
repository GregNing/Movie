class Review < ApplicationRecord
    belongs_to :user
    belongs_to :moviegroup
    validates :content, presence: true

    #使用 scope做排序動作

    scope :recent, ->{ order("created_at DESC") }
    
end
