class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :load_micropost, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = t ".created"
      redirect_to root_url
    else
      @feed_items = []
      render "static_pages/home"
    end
  end

  def destroy
    if @micropost.destroy
      flash[:success] = t ".deleted"
      redirect_to request.referrer || root_url
    else
      flash[:danger] = t ".not_delete"
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end

  def load_micropost
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
