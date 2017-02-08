class AddStatusToSwaps < ActiveRecord::Migration[5.0]
  def change
    add_column :swaps, :status, :string, :default => "pending"
  end
end
