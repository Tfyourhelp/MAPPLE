module Users
  class BaseController < ApplicationController
    def logged_in_user
      #require_logged_in("user")
      if logged?
    end
  end
end
