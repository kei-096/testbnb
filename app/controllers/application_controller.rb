class ApplicationController < ActionController::Base
  include Clearance::Controller
end

def index
	# do things here
end

# def allowed?(action:, user:)
# 	if user.customer?
#       flash[:notice] = "Sorry. You are not allowed to perform this action."
#         return redirect_to root_path notice: "Sorry. You do not have the permission to verify a property."
#     end
# end
