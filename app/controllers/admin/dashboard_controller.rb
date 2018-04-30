class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with :username => ENV["DATABASE_USERNAME"], :password => ENV["DATABASE_PASSWORD"]

  def show
  end
end
