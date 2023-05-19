 class Room < ApplicationRecord
  belongs_to :user 
        has_one_attached :avatar
        has_many :reservations 
        def self.ransackable_attributes(auth_object = nil)
          ['address', 'avatar', 'created_at', 'id', 'image', 'introduction', 'name', 'price', 'room_id', 'updated_at', 'user_id']
        end    
        def self.ransackable_associations(auth_object = nil)
          ['avatar_attachment', 'avatar_blob', 'reservations', 'user']
        end
        def self.search(query, area)
                if query.present? && area.present?
                  where('name LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%")
                    .where('address LIKE ?', "%#{area}%")
                elsif query.present?
                  where('name LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%")
                elsif area.present?
                  where('address LIKE ?', "%#{area}%")
                else
                  all
                end
              end
end
