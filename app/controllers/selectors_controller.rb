class SelectorsController < ApplicationController

  def index
    @request = Requester.find(params[:request_id])
    @requester = User.find(@request.user_id)
  end

  def create
    #maybe needs Requester.selector.create
    @selector = Selector.create(user_id: params[:user_id],
                                item_id: params[:item_id],
                                requester_id: params[:requester_id])

    redirect_to '/users/:id/profile/selectors/complete'
  end

  def show

  end


end
