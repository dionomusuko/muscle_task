class Post < ApplicationRecord
  belongs_to :user
  scope :recent, -> { order(created_at: :desc)}

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 2000 }

end
