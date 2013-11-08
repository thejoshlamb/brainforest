class SessionsController < ApplicationController

	# To create a log in, there is no need to instantiate a new 'session' by creating a new instance. 
	# When we hit the 'submit' button, our create action is triggered.
	def new
  end

  def create
  	user = User.find_by_email(params[:email]) # find a user by the email typed in the email input field and assign it to the variable 'user'
  	if user && user.authenticate(params[:password]) # check if that user exists and that it can be authenticated with the password typed in the password input field
  		session[:user_id] = user.id #create a key-value pair in the session hash. ':user_id' is the key and the user's id is the value
  		redirect_to products_url, :notice => "Logged in!"
  	else
  		flash.now[:alert] = "Invalid email or password"
  		render "new"
  	end
  end
		# This gist of logging in is that we are setting a hash in our users' browser to let our server (application) 
 		# reference as they navigate through the application.

  def destroy
  	session[:user_id] = nil
  	redirect_to products_url, :notice => "Logged out."
  end
end
