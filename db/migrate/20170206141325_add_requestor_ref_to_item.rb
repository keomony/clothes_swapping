class AddRequestorRefToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :requester, foreign_key: true
  end
end
