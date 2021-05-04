class AddReviewsToUsersAndProducts < ActiveRecord::Migration
  def change
    add_reference :users, :review, index: true, foreign_key: true
    add_reference :products, :review, index: true, foreign_key: true
  end
end
