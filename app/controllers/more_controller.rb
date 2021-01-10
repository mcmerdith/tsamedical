class MoreController < ApplicationController
  def contact
    # If the form was "submitted", validate params
    if request.post?
      if params[:fname].blank? ||
        params[:lname].blank? ||
        params[:email].blank? ||
        params[:content].blank? then
        # If the form is missing fields, show a fake error message
        @error = true
      else
        # If the form is okay, show a fake confirm message
        @okay = true
      end
    end
  end
end
