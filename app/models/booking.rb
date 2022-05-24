class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :glamping_set
end
