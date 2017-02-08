class AddSelectorRefToRequesters < ActiveRecord::Migration[5.0]
  def change
    add_reference :requesters, :selector, foreign_key: true
  end
end
