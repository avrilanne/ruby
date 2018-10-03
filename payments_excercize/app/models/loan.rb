class Loan < ActiveRecord::Base
  has_many :payments
  after_create :assign_outstanding_balance

  private

  def assign_outstanding_balance
    update_attributes(outstanding_balance: funded_amount)
  end
end
