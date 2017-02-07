class AddItemRefToSelectors < ActiveRecord::Migration[5.0]
  def change
    add_reference :selectors, :item, foreign_key: true
  end
end
