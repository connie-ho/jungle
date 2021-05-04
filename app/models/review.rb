class Review < ActiveRecord::Base

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true
end
