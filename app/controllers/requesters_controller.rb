class RequestersController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    result = item.requesters.new(item_id: item.id, user: current_user)
    if result.save
      redirect_to item_path(item.id), notice: "Your request has successfully been made"
    else
      if result.errors[:item]
        redirect_to item_path(item.id), notice:  "You have already requested this item"
      else
        redirect_to item_path(item.id), notice:  "Can't request this item. Unknown error"
      end
    end
  end

  def index
    my_items = Item.where(user_id: current_user.id)
    my_item_ids = my_items.ids
    @requests = Requester.where(item_id: my_item_ids)
    if completed_requests != nil
      @uncompleted_requests = @requests - completed_requests
    else
      @uncompleted_requests = @requests
    end
  end

  def completed_requests
    if Selector.any?
    my_selectors = Selector.where(user_id: current_user.id)
    my_selectors_id = my_selectors.ids
    my_requesters = Requester.where(user_id: current_user.id)
    swaps = Swap.where(selector_id: my_selectors_id)
    ids = []
    swaps.each {|swap| ids << swap.requester_id }
    completed_requests = Requester.where(id: ids)
  end
  end

end
