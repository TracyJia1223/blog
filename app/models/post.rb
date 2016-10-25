class Post < ApplicationRecord
  has_many :comments, -> {order(created_at: :desc)}, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, uniqueness: {case_sensitive: false, message: 'must be unique'}
  validates :body, length: { minimum: 5 }

  def self.search(search)
    where("title ILIKE ? OR body ILIKE ?","%#{search}%","%#{search}%")
  end
end
