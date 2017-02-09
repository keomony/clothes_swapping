class SelectorsController < ApplicationController

  def index
    @requester = Requester.find(params[:request_id])
    @request_user = User.find(@requester.user_id)
  end

  def new
    @selector = Selector.new
  end

  def create
    @selector = Selector.new(selector_params)
    if @selector.save
      Swap.create!(requester_id: params[:requester_id], selector_id: @selector.id, status: 'Confirmed')
      redirect_to swaps_path, notice:  "Your swap has successfully been completed"
      # redirect_to '/users/:id/profile/selectors/complete'
    else
      redirect_to request_back_path, notice:  "You have already requested this item"
    end
  end

  def show
    @my_selected = Selector.where(user_id: current_user.id)
  end

  private

  def selector_params
    params.permit(:user_id, :item_id, :requester_id)
  end

end
