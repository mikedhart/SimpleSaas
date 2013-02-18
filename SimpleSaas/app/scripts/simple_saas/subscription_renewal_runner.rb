module SimpleSaas
  class SubscriptionRenewalRunner
  	def self.run
  	  # Get subscriptions to renew.
  	  to_renew = Subscription.where("renew_on = '#{Date.current}' AND active = 1").all

  	  # For each, take payment then update the renew on date.
  	  to_renew.each do |subscription|
  	  	# Take payment here. If payment fails, set active to false.

  	  	# Now update.
  	  	subscription.renew_on = Date.current + subscription.subscription_type.duration.days
  	  	subscription.save
  	  end
	  puts to_renew.to_s
	  puts Date.current
  	end
  end
end
