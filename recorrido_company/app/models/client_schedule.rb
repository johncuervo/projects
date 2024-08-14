class ClientSchedule < ApplicationRecord
  belongs_to :client
  has_many :schedule_assignments, dependent: :destroy

  validates :start_hour, presence: true
  validates :end_hour, presence: true
  validates :day_of_week, presence: true
end
