class StaticPagesController < ApplicationController
  def new
    @tour_detail = TourDetail.new
  end

  def home
    @tour_details = TourDetail.all
  end

  def help; end

  def about; end
end
