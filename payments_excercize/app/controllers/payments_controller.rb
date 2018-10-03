class PaymentsController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'Loan not found', status: :loan_not_found
  end

  def new
    payment_params
    @loan = Loan.find(params[:loan_id])
    return redirect_to loan_path(@loan) if @loan.paid
    @payment = Payment.new(amount: params[:amount], loan_id: @loan.id)
    begin
      @payment.save!
    rescue ActiveRecord::RecordInvalid
      return render json: "#{@payment.errors.full_messages}", status: :validation_errors
    end
      redirect_to loan_path(@loan)
  end

  def index
    render json: Loan.find(params[:loan_id]).payments
  end

  def show
    render json: Payment.find(params[:id])
  end

  private

  def payment_params
    return render json: "incorrect params: enter as such '?loan_id=THELOANID&amount=AMOUNT'", status: :incorrect_params if params[:loan_id].nil? || params[:amount].nil?
    return render json: "incorrect params: please enter an amount larger than 0", status: :incorrect_params if params[:amount].to_i == 0
    @loan_id = params[:loan_id]
    @payment_amount = params[:amount].to_i
  end

end

# SAMPLE REQUEST
# http://localhost:3000/loans/LOANID/payments/new?amount=PAYMENTAMOUNT
# http://localhost:3000/loans/1/payments/new?amount=145
