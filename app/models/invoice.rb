class Invoice < ApplicationRecord
  enum :status, active: "Vigente", cancelled: "Cancelado"

  scope :filter_by_date, ->(start_date, end_date) {
    if start_date.present? && end_date.present?
      where(invoice_date: Date.parse(start_date).beginning_of_day..Date.parse(end_date).end_of_day)
    else
      where(invoice_date: Time.zone.today.all_day)
    end
  }

  def readonly?
    !Rails.env.test?
  end
end
