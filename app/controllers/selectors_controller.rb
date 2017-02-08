class SelectorsController < ApplicationController

  def index
    @requester = Requester.find(params[:request_id])
    @request_user = User.find(@requester.user_id)
  end

  def new
    @selector = Selector.new
  end

  def create
    @selector = Selector.create!(selector_params)
    redirect_to '/users/:id/profile/selectors/complete'
  end

  def show
    @my_selected = Selector.where(user_id: current_user.id)
    # p @my_selected
  end

  private

  def selector_params
    params.permit(:user_id, :item_id, :requester_id)
  end

end
