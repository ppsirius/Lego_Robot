class NavigationController < ApplicationController
	before_action :authenticate_user!, :except => [:index]
	before_action :create_robot



	def lock
		if @new_robot.lock != "OK"
		flash[:notice] = "Ktoś już korzysta z robota"
		end
		current_user.credits.create(:credit => false)
		redirect_to navigation_index_path
	end

	def index
		begin
		@prox = @new_robot.proximity
		rescue Exception => e
		flash[:notice] = "Robot nie dostępny"
		end
	end

	def forward
		@new_robot.forward
		redirect_to navigation_index_path
	end

	def backward
		@new_robot.backward
		redirect_to navigation_index_path
	end

	def slow_forward
		@new_robot.slow_forward
		redirect_to navigation_index_path
	end

	def slow_backward
		@new_robot.slow_backward
		redirect_to navigation_index_path
	end

	def left
		@new_robot.left
		redirect_to navigation_index_path
	end

	def right
		@new_robot.right
		redirect_to navigation_index_path
	end

	def run
		@new_robot.run
		redirect_to navigation_index_path
	end

	def attack
		@new_robot.attack
		redirect_to navigation_index_path
	end



end
