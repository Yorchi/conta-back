class TopDaysWithMorningSalesJob < ApplicationJob
  queue_as :default

  def perform(email:)
    InvoiceMailer.with(days: days.to_json, email:).top_days_with_morning_sales.deliver_later
  end

  def days
    Rails.cache.fetch("top_days", expires_in: 1.day) do
      Invoice
        .where("EXTRACT(HOUR FROM invoice_date) >= ? AND EXTRACT(HOUR FROM invoice_date) < ?", 6, 12)
        .group("DATE(invoice_date)")
        .select("DATE(invoice_date) AS day, SUM(total) AS total_sales")
        .order("total_sales DESC")
        .limit(10)
    end
    
  end
end
