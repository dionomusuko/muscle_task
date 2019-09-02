class Task < ApplicationRecord
  validates :name, presence: true

  validates :menu, presence: true

  validates :rep, presence: true

  validates :set, presence: true

  validates :time, presence: true

  belongs_to :user

  scope :recent, -> { order(created_at: :desc)}

end
