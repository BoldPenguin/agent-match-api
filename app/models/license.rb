class License < ApplicationRecord
  validates :state, presence: true
  belongs_to :agent
end
