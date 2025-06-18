require 'rails_helper'

RSpec.describe TopDaysWithMorningSalesJob, type: :job do
  subject(:job) { described_class.perform_later(email: 'hola@conta.link') }

  it 'queues the job' do
    expect { job }.to have_enqueued_job(described_class)
      .with(email: 'hola@conta.link')
      .on_queue("default")
  end
end
