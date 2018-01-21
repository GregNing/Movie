class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  # user.moviegroups 撈出全組
  has_many :moviegroups
  has_many :reviews
  has_many :moviegroup_relationships
  has_many :participated_moviegroups, :through => :moviegroup_relationships, :source => :moviegroup

  def is_member_of?(group)
    participated_moviegroups.include?(group)    
  end

  def join!(group)
    participated_moviegroups << group
  end

  def quit!(group)
    participated_moviegroups.delete(group)
  end
end
