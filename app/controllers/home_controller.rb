class HomeController < ApplicationController
  def landing_page
    @portfolios = Portfolio.all 
  end
end
