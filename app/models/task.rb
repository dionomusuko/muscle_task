class Task < ApplicationRecord
  validates :menu, presence: true


  belongs_to :user

  scope :recent, -> { order(created_at: :desc)}

end
