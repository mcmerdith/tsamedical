class MoreController < ApplicationController
  def contact
    # If the form was "submitted", validate params

    if request.post?
      if params[:fname].blank? ||
        params[:lname].blank? ||
        params[:email].blank? ||
        params[:content].blank? then
        # If the form is missing fields, show a fake error message
        flash.now[:alert] = "One or more fields was incorrect"
      else
        # If the form is okay, show a fake confirm message
        flash.now[:success] = "Your contact request has been submitted"
        params[:fname] = nil
        params[:lname] = nil
        params[:email] = nil
        params[:content] = nil
      end
    end
  end
end
