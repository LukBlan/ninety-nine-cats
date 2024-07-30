class Cat < ApplicationRecord
  COLORS = ["cream", "white", "orange", "brown", "blue-gray", "black"]
  VALID_SEX = ["M", "F"]

  validates :name, :birth_date, :description, :color, :sex, presence: true
  validates :color, inclusion: COLORS
  validates :sex, inclusion: VALID_SEX

  has_many :cat_rental_requests, dependent: :destroy

  def age
    birthday = self.birth_date
    today_date = Date.today
    total_years = today_date.year - birthday.year

    if birthday.month > today_date.month
      total_years -= 1
    elsif birthday.month == today_date.month && birthday.day > today_date.day
      total_years -= 1
    end

    p total_years
  end
end
