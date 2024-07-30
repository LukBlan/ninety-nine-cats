class CatRentalRequest < ApplicationRecord
  STATUS_CODES = ["APPROVED", "DENIED", "PENDING"]

  validates :cat_id, :status, :end_date, :start_date, presence: true
  validates :status, inclusion: STATUS_CODES
  validate :overlapping_request

  belongs_to :cat

  def overlapping_request
    result = CatRentalRequest.where(":start BETWEEN start_date AND end_date", start: self.start_date)
                      .where(cat_id: self.cat_id, status: "APPROVED").count
    p result
    self.errors.add :start_date, "Provided date overlap with already approved one" unless result == 0
  end
end
