class Room < ApplicationRecord
    has_one_attached :avatar
    has_many :reservations      
end
