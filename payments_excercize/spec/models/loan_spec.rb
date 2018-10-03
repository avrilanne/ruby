require 'rails_helper'

RSpec.describe Loan do
  subject { described_class.create(funded_amount: funded_amount) }

  let(:funded_amount) { 300 }

  describe ".assign_outstanding_balance" do
    it "assigns outstanding balance to funded amount on creation" do
      expect(subject.funded_amount).to eq(subject.outstanding_balance)
    end
  end
end
