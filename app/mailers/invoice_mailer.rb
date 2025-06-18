class InvoiceMailer < ApplicationMailer
  default from: "noreply@example.com"

  def top_days_with_morning_sales
    @days = JSON.parse(params[:days])
    email = params[:email]

    mail(to: email, subject: "Top 10 dias con mejores ventas en las mañanas")
  end
end
