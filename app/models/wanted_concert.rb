class WantedConcert < ApplicationRecord
  belongs_to :user
  validates :department, presence: true


end
