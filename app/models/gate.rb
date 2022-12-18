class Gate < ApplicationRecord
  belongs_to :user
  has_many :registers
end
