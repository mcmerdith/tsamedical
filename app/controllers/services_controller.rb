class ServicesController < ApplicationController
  http_basic_authenticate_with name: "mcmerdith", password: "password", except: :index
end
