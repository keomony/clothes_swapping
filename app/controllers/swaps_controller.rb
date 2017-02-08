class SwapsController < ApplicationController

  def index
    cu_id = current_user.id
    my_selectors = Selector.where(user_id: cu_id)
    my_selector_ids = my_selectors.ids

    check_selector = Requester.where(user_id: cu_id)
    selectors = Selector.where(requester_id: check_selector.ids)
    @swaps = Swap.where(selector_id: my_selector_ids)
    @swaps += Swap.where(selector_id: selectors.ids)

  end

end
