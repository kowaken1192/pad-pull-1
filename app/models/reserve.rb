class Reserve < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :check_in, presence: { message: "チェックイン日を入力してください" }
  validates :check_out, presence: { message: "チェックアウト日を入力してください" }
  validate :check_out_after_check_in
  validates :number_of_people, presence: true, numericality: { only_integer: true, greater_than: 0 }
  def total_day
    total_day = (checkout_at - checkin_at).to_i
  end

  def total_price
    total_price = (total_day * person_count * room.fee)
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
    if check_in.present? && check_out.present? && check_out <= check_in
      errors.add(:check_out, "はチェックイン日より後の日付にしてください")
    end
  end
end