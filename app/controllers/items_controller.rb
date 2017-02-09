class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  # GET /items
  # GET /items.json
  def index
    if current_user
      @user = User.find(current_user.id)
      @uncompleted_items = Item.all - @user.items - completed_items
    else
      @uncompleted_items = Item.all - completed_items
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @user = User.find(current_user.id)
    @item = @user.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to '/items', notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    @item = Item.find(params[:id])
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:description, :size, :color, :category, :image)
    end
end
