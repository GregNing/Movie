class MoviegroupRelationship < ApplicationRecord
    belongs_to :moviegroup
    belongs_to :user
end
