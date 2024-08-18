class CatRentalRequest < ApplicationRecord
  STATUS_CODES = ["APPROVED", "DENIED", "PENDING"]

  validates :cat_id, :status, :end_date, :start_date, presence: true
  validates :status, inclusion: STATUS_CODES
  validate :check_approved_overlapping_request

  belongs_to :cat
  belongs_to :requester, foreign_key: :requester_id, class_name: "User"

  def check_approved_overlapping_request
    result = overlapping_request.where(status: "APPROVED").count
    self.errors.add :start_date, "Provided date overlap with already approved one" unless result == 0
  end

  def overlapping_request
    CatRentalRequest.where(":start BETWEEN start_date AND end_date", start: self.start_date)
                    .where(cat_id: self.cat_id)
                    .where.not(id: self.id)
  end

  def approve!
    ActiveRecord::Base.transaction do
      self.update(status: "APPROVED")
      overlapping_request.update_all(status: "DENIED")
    end
  end

  def deni!
    self.update(status: "DENIED")
  end

  def pending?
    self.status == "PENDING"
  end
end
