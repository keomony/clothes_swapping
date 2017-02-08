class SelectorsController < ApplicationController

  def index
    @requester = Requester.find(params[:request_id])
    @request_user = User.find(@requester.user_id)
  end

  def new
    @selector = Selector.new
  end

  def create
    #maybe needs Requester.selector.create
    # require 'pry'; binding.pry
    @selector = Selector.create!(selector_params)
    redirect_to '/users/:id/profile/selectors/complete'
  end

  def show
    # @requester = Requester.find(params[:request_id])
    # @requester = Requester.where(user_id: current_user.id)
    @my_selected = Selector.where(user_id: current_user.id)
    p @my_selected
    # require 'pry'; binding.pry

    # @items = @my_selected.items
    # @requesters = Requester.where(user_id: @items.user.id)
  end

  private

  def selector_params
    params.permit(:user_id, :item_id, :requester_id)
  end

end
