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

      self.method(@subscription.subscription_type.payment_method.name).call
    end

    def paypal_express
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @payment }
      end
    end

    def paypal_recurring
      if (params[:token] && params[:PayerID])
        @subscription.token = params[:token]
        @subscription.payer_id = params[:PayerID]
        @subscription.save

        puts "********** HERE ********** HERE ********** HERE ********** HERE ********** HERE "

        ppr = PayPal::Recurring.new({
          :token       => params[:token],
          :payer_id    => params[:PayerID],
          :amount      => @subscription.subscription_type.cost.to_s,
          :description => @subscription.subscription_type.name.to_s
        })

        response = ppr.request_payment
        # response.approved?
        # response.completed?

        if (response.approved?) then
          puts "********** HERE2 ********** HERE2 ********** HERE2 ********** HERE2 ********** HERE2 "
          ppr = PayPal::Recurring.new({
            :amount          => @subscription.subscription_type.cost.to_s,
            :currency        => "USD",
            :description     => @subscription.subscription_type.name.to_s,
            :ipn_url         => PAYPAL_NOTIFY_URL,
            :frequency       => 1,
            :token           => params[:token],
            :period          => :monthly,
            :payer_id        => params[:PayerID],
            :start_at        => Time.now,
            :failed          => 1,
            :outstanding     => :next_billing,
            :trial_length    => 1,
            :trial_period    => :monthly,
            :trial_frequency => 1
          })

          puts "**edeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee***************/*/"
          response = ppr.create_recurring_profile
          @subscription.profile_id = response.profile_id
          @subscription.save

          render "paypal_recurring"
        else
          raise response.errors.inspect
          response.errors.each do |error|
            flash[:notice] = error
          end

          redirect_to subscriptions_path
        end
      else
        ppr = PayPal::Recurring.new({
          :return_url   => "http://localhost:3000/s/subscriptions/#{@subscription.id}/payments/new",
          :cancel_url   => PAYPAL_RETURN,
          :ipn_url      => PAYPAL_NOTIFY_URL,
          :description  => @subscription.subscription_type.name.to_s,
          :amount       => @subscription.subscription_type.cost.to_s,
          :currency     => "USD"
        })

        response = ppr.checkout
        puts "*************************************"
        
        redirect_to response.checkout_url if response.valid?
      end
    end
  
    # GET /payments/1/edit
    def edit
      @payment = Payment.find(params[:id])
    end
  
    # POST /payments
    # POST /payments.json
    def create
      currency = Currency.find_by_short_code(params[:mc_currency])
      subscription = (params[:payer_id]) ? Subscription.find_by_payer_id(params[:payer_id]) : Subscription.find(params[:invoice])

      if params[:payment_status] == "Completed" then
        subscription.active = true
        subscription.renew_on = Date.current + subscription.subscription_type.duration.days
        subscription.save
      end

      payment = Payment.create!(
        :payment_type_id => PaymentType.find_by_name("cr").id,
        :amount => params[:mc_gross],
        :currency_id => currency.id,
        :rebased => (params[:mc_gross].to_f / currency.exchange_rate),
        :subscription_id => subscription.id,
        :transaction_id => params[:txn_id],
        :comment => params,
        :payment_status => params[:payment_status]
      )


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
