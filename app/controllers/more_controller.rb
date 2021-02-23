class MoreController < ApplicationController
  http_basic_authenticate_with name: "webmaster2021", password: "doclineadmin", only: :authenticate

  def contact
    # If the form was "submitted", validate params

    if request.post?
      if params[:fname].blank? ||
        params[:lname].blank? ||
        params[:email].blank? ||
        params[:content].blank? then
        # If the form is missing fields, show a fake error message
        flash.now[:alert] = "One or more fields was blank or invalid"
      else
        # If the form is okay, show a fake confirm message
        flash.now[:success] = "Your contact request has been submitted. Expected response time is 1-3 business days."
        params[:fname] = nil
        params[:lname] = nil
        params[:email] = nil
        params[:content] = nil
      end
    end
  end

  def authenticate
    session[:siteadmin] = true
    redirect_to root_path
  end

  def logout
    session[:siteadmin] = false
    redirect_to root_path
  end
end
