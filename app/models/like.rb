class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :post_id, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
end
