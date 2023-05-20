class Post < ApplicationRecord
    has_many :reserves
    has_many :rooms 
end
