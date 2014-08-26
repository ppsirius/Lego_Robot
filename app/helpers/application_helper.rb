module ApplicationHelper

 
	def count_credit
		current_user.credits.where(:credit => true).count - current_user.credits.where(:credit => false).count 
	end

end
