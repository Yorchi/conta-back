require 'rails_helper'

RSpec.describe "InvoicesController", type: :request do
  context "As an user I want to see all my invoices in my own application" do
    before do
      create_list(:invoice, 25)
    end

    describe "GET /invoices" do
      it 'do a request to invoices url' do
        get invoices_path

        invoices = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(invoices.count).to eq(25)
      end
    end

    describe "GET /invoices?start_date=&end_date=" do
      it 'filters invoices by a same day' do
        start_date = '2025-06-15'
        end_date = '2025-06-17'
        create_list(:invoice, 10, invoice_date: start_date)
        create_list(:invoice, 10, invoice_date: end_date)

        get invoices_path(start_date:, end_date: start_date)

        invoices = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(invoices.count).to eq(10)
      end

      it 'filters invoices by a given date range' do
        start_date = '2025-06-15'
        end_date = '2025-06-17'
        create_list(:invoice, 10, invoice_date: start_date)
        create_list(:invoice, 10, invoice_date: end_date)

        get invoices_path(start_date: , end_date: )

        invoices = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(invoices.count).to eq(20)
      end
    end
  end
end
