class RequestersController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!

  def create
    item = Item.find(params[:item_id])
    requester = item.requesters.build_with_user(swap_request_params, current_user)
    if requester.save
      redirect_to '/'
    else
      redirect_to '/items'
    end
  end

  private
  def swap_request_params
    params.require(:requester).permit(:item_id)
  end
end
