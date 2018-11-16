class StaticPagesController < ApplicationController

  def home
    @tour_detail = TourDetail.new
    @tour_detail.build_tour
    @tour_detail.build_place
    @tour_details = TourDetail.all
  end

  def help; end

  def about; end
end
