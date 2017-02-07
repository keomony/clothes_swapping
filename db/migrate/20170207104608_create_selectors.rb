class CreateSelectors < ActiveRecord::Migration[5.0]
  def change
    create_table :selectors do |t|

      t.timestamps
    end
  end
end
