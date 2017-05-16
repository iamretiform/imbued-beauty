class Appointment < ApplicationRecord
  has_many :services
  belongs_to :admin_user
  belongs_to :client
end
