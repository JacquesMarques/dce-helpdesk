class Ticket < ApplicationRecord
  include HasStatus

  belongs_to :user
  belongs_to :department

  validates :title, presence: true
  validates :status, presence: true
end
