class SelectorsController < ApplicationController

  def index
    @request = Requester.find(params[:request_id])
    @requester = User.find(@request.user_id)
  end

end
