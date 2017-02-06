class RequestersController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    result = item.requesters.new(item_id: params[:item_id], user: current_user)
    if result.save
      redirect_to item_path(params[:item_id])
    else
      if result.errors[:item_id]
        redirect_to items_path, notice:  "You have already requested this item"
      else
        redirect_to items_path, notice:  "Can't request this item. Unknown error"
      end
    end
  end

end
