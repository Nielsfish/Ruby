class User < ApplicationRecord
    has_many :employees
    has_many :gates
    has_many :managers
end

