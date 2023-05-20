class Reserve < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :head_count, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :check_out_after_check_in
  validates :check_out, presence: true, if: :check_in_present?
  attr_accessor :number_of_people

  
  def calculate_and_save(room)
    @check_in = self.check_in
    @check_out = self.check_out
    @total_day = (@check_out - @check_in).to_i
    @number_of_people = self.number_of_people
    @total_price = room.price.to_i * @total_day * @number_of_people.to_i

    if self.save
      return true
    else
      return false
    end
  end
  def check_in_present?
    check_in.present?
  end
  def total_days
    (check_out_in - check_in).to_i
  end
  def total_price
    room = Room.find(room_id)
    total_day * number_of_people.to_i *  @room.price.to_i
  end
  validate :check_out_after_check_in
  def check_out_after_check_in
    if check_out && check_out <= check_in
      errors.add(:check_out, "はチェックイン日より後の日付にしてください")
    end
  end
end
