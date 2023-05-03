class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :head_count, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :check_out_after_check_in
  validates :check_out, presence: true, if: :check_in_present?


  def check_in_present?
    check_in.present?
  end
  
  validate :check_out_after_check_in
  
  def check_out_after_check_in
    if check_out && check_out <= check_in
      errors.add(:check_out, "はチェックイン日より後の日付にしてください")
    end
  end
  
end
