class AddReviewsToUsersAndProducts < ActiveRecord::Migration
  def change
    add_reference :products, :reviews, index: true, foreign_key: true
  end
end
