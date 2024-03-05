class ApplicationController < ActionController::API
	 before_action  :current_user_session

	 # read email from session
	def email_key
	    request.headers["EMAIL"]
	end

	def not_found
   		respond_with '{"error": "not_found"}', status: :not_found
   	end

	 private

	 # Set user session
	 def current_user_session
	 	if email_key.present?
	 		user = User.find_by(email: email_key)
	 	else
	 		user = User.first	
	 	end
	 	@current_user = user	
	 end


end
