class ErrorsController < ApplicationController
  def server
    render status: 500
  end
  def invalidrequest
    render status: 400
  end
  def unauthorized
    render status: 401
  end
  def forbidden
    render status: 403
  end
  def notfound
    render status: 404
  end
  def unnacceptable
    render status: 422
  end
end
