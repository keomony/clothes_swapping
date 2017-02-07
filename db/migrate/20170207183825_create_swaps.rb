class CreateSwaps < ActiveRecord::Migration[5.0]
  def change
    create_table :swaps do |t|

      t.timestamps
    end
  end
end
