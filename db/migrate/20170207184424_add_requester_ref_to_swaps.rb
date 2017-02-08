class AddRequesterRefToSwaps < ActiveRecord::Migration[5.0]
  def change
    add_reference :swaps, :requester, foreign_key: true
  end
end
