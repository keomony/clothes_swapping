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
    bob = Item.where(user_id: current_user.id)
    my_item_ids = bob.ids
    @requests = Requester.where(item_id: my_item_ids) 
  end

end
