class SelectorsController < ApplicationController

  def index
    @requester = Requester.find(params[:request_id])
    @request_user = User.find(@requester.user_id)
    @request_user_items = @request_user.items - completed_items
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
  def completed_requester_items
    swaps = Swap.all
    completed_requests_id = swaps.map {|swap| swap.requester_id }
    completed_requests = Requester.where(id: completed_requests_id)
    completed_items_id_requests = completed_requests.map {|request| request.item_id}
    completed_items_requests = Item.where(id: completed_items_id_requests)
  end

  def completed_selector_items
    swaps = Swap.all
    completed_selectors_id = swaps.map {|swap| swap.selector_id } #find_ids(swap)
    completed_selectors = Selector.where(id: completed_selectors_id)
    completed_items_id_selectors = completed_selectors.map {|selectors| selectors.item_id} #find_ids(completed_selectors)
    completed_items_selectors = Item.where(id: completed_items_id_selectors)
  end

  def completed_items
    completed_selector_items + completed_requester_items
  end
  
  def selector_params
    params.permit(:user_id, :item_id, :requester_id)
  end

end
