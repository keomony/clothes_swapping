class AddItemRefToRequesters < ActiveRecord::Migration[5.0]
  def change
    add_reference :requesters, :item, foreign_key: true
  end
end
