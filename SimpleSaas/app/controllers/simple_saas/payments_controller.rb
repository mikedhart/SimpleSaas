require_dependency "simple_saas/application_controller"

module SimpleSaas
  class PaymentsController < ApplicationController
    protect_from_forgery :accept => [:create]
    # GET /payments
    # GET /payments.json
    def index
      @payments = Payment.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @payments }
      end
    end
  
    # GET /payments/1
    # GET /payments/1.json
    def show
      @payment = Payment.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @payment }
      end
    end
  
    # GET /payments/new
    # GET /payments/new.json
    def new
      @payment = Payment.new
      @subscription = Subscription.find(params[:subscription_id])
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @payment }
      end
    end
  
    # GET /payments/1/edit
    def edit
      @payment = Payment.find(params[:id])
    end
  
    # POST /payments
    # POST /payments.json
    def create
      currency = Currency.find_by_short_code(params[:currency_code])
      payment = Payment.create!(
        :payment_type_id => PaymentType.find_by_name("cr").id,
        :amount => params[:amount],
        :currency_id => currency.id,
        :rebased => params[:amount] / currency.exchange_rate,
        :subscription_id => params[:subscription_id],
        :transaction_id => params[:txn_id]
      )
  
      render :nothing => true
    end
  
    # PUT /payments/1
    # PUT /payments/1.json
    def update
      @payment = Payment.find(params[:id])
  
      respond_to do |format|
        if @payment.update_attributes(params[:payment])
          format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @payment.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /payments/1
    # DELETE /payments/1.json
    def destroy
      @payment = Payment.find(params[:id])
      @payment.destroy
  
      respond_to do |format|
        format.html { redirect_to payments_url }
        format.json { head :no_content }
      end
    end
  end
end
