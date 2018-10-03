class Payment < ActiveRecord::Base
  belongs_to :loan
  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
  validates :loan_id, :presence => true
  before_create :recalculate_outstanding_balance
  validate :outstanding_balance_vs_amount

  def recalculate_outstanding_balance
    loan.update_attributes(outstanding_balance: loan.outstanding_balance - amount)
    loan.update_attributes(paid: true) if loan.outstanding_balance == 0
  end

  def outstanding_balance_vs_amount
    errors.add(:amount, :outstanding, message: "outstanding_balance is #{loan.outstanding_balance} payment amount must be less than outstanding") if loan.outstanding_balance < amount
  end
end
