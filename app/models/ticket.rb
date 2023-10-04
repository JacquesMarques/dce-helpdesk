class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :department

  validates :name, presence: true
  validates :status, presence: true
end
