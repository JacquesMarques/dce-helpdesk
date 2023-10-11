class Department < ApplicationRecord
  include HasStatus

  validates :name, presence: true
  validates :status, presence: true
end
