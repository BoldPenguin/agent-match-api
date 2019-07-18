class Agent < ApplicationRecord
  validates :name, :phone_number, presence: true
  has_many :licenses
  has_and_belongs_to_many :carriers
end
