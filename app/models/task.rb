class Task < ApplicationRecord
  validates :name, presence: true


  belongs_to :user

  scope :recent, -> { order(created_at: :desc)}

end
