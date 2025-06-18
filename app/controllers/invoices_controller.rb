class InvoicesController < ApplicationController
  def index
    start_date = filter_params[:start_date]
    end_date = filter_params[:end_date]

    @invoices = Rails.cache.fetch(generate_cache_key(start_date, end_date), expires_in: 12.hours) do
      Invoice.filter_by_date(start_date, end_date)
    end

    render json: @invoices
  end

  private
    def generate_cache_key(start_date, end_date)
      if start_date.present? || end_date.present?
        "invoices:#{start_date.presence || ''}-#{end_date.presence || ''}"
      else
        "invoices:today-#{Time.zone.today.to_s}"
      end
    end

    def filter_params
      params.permit(:start_date, :end_date)
    end
end
