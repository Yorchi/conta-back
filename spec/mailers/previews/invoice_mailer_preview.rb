# Preview all emails at http://localhost:3000/rails/mailers/invoice_mailer
class InvoiceMailerPreview < ActionMailer::Preview
  def top_days_with_morning_sales
    days = [
      {
        "day": '2025-06-01',
        "total_sales": 6_200.00 
      }
    ].to_json
    InvoiceMailer.with(days: days, email: 'hola@conta.link').top_days_with_morning_sales
  end
end
