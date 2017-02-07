class AddSelectorRefToSwaps < ActiveRecord::Migration[5.0]
  def change
    add_reference :swaps, :selector, foreign_key: true
  end
end
