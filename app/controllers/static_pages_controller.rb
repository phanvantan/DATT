class StaticPagesController < ApplicationController
  def home
    @tours = Tour.all
  end

  def help; end

  def about; end
end
