require 'rails_helper'

RSpec.describe Payment do
  subject { described_class.new(amount: payment_amount, loan_id: loan.id) }

  let(:loan) { Loan.create(funded_amount: funded_amount) }
  let(:funded_amount) { 300 }
  let(:payment_amount) { 150 }
  let(:large_payment) { 4000 }

  describe ".recalculate_outstanding_balance" do
    context "with payment amount equal to outstanding" do
    let(:payment_amount) { 300 }
      it "validates amount numerality" do
        subject.recalculate_outstanding_balance
        loan.reload
        expect(loan.paid).to be true
      end
    end

    context "with payment amount not equal to outstanding" do
    let(:payment_amount) { 150 }
      it "validates amount numerality" do
        subject.recalculate_outstanding_balance
        loan.reload
        expect(loan.paid).to be false
      end
    end
  end

    describe ".outstanding_balance_vs_amount" do
    context "with payment amount exceeding to outstanding" do

    let(:payment_amount) { 30000 }
      it "validates presence of errors" do
        subject.outstanding_balance_vs_amount
        loan.reload
        expect(subject.errors.full_messages.length).to be >= 1
      end
    end

    context "with payment amount not exceeding to outstanding" do
    let(:payment_amount) { 150 }
      it "validates no errors" do
        subject.outstanding_balance_vs_amount
        loan.reload
        expect(subject.errors.full_messages.length).to be 0
      end
    end
  end
end

