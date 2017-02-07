class AddRequesterRefToSelectors < ActiveRecord::Migration[5.0]
  def change
    add_reference :selectors, :requester, foreign_key: true
  end
end
