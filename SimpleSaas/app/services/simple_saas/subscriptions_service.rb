module SimpleSaas
  class SubscriptionsService
  	def initialize (subscription)
		  @subscription = subscription
  	end

  	def self.create (params)
  		subscription = Subscription.new(params[:subscription])
  		subscription.save

      

  		subscription
  	end
  end
end