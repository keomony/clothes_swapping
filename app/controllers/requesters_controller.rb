class RequestersController < ApplicationController
  before_action :authenticate_user!

  def index
  end
  def new
    render :new
  end

  def create
    @item = Item.find(params[:item_id])
    @requester = @item.requesters.create(item_id: @item.id, user: current_user)
    if @requester.save
      redirect_to item_path(params[:item_id])
    else
      if @requester.errors[:user]
        redirect_to items_path, alert: "You have already requested this item"
      else
        render :new
      end
    end
  end

    private

    def build_request(attributes = {}, user)
      attributes[:user] ||= user
      reviews.build(attributes)
    end
end
