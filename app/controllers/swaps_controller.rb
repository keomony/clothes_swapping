class SwapsController < ApplicationController
  def index
    my_selectors = Selector.where(user_id: current_user.id)
    my_selector_ids = my_selectors.ids
    @swaps = Swap.where(selector_id: my_selector_ids)
  end
end
