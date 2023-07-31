class Schedule < ApplicationRecord
  validates :title, presence: true, length: { maximum:20 }
  validates :start, presence: true
  validates :end, presence: true
  validates :memo, length: { maximum:500 }
  validate :start_date

  def start_date
      if start.present? && self.end.present? && start > self.end
      errors.add(:start, "を終了日以降に日付指定することは出来ません")
      end
  end
end
