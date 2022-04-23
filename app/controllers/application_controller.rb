class ApplicationController < ActionController::Base
  
  def hello
    render html: "Hi, world!"
  end
end
