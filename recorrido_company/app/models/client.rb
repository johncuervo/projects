class Client < ApplicationRecord
  has_many :client_schedules, dependent: :destroy
  has_many :schedule_assignments, dependent: :destroy

  validates :name, presence: true
end
