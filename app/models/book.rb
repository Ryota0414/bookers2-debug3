class Book < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
