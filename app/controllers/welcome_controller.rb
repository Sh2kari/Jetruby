class WelcomeController < ApplicationController
  def wrap_with_h1
    "<h1>#{yield}</h1>".html_safe
  end
end
