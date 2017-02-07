class CreateRequesters < ActiveRecord::Migration[5.0]
  def change
    create_table :requesters do |t|
      
      t.timestamps
    end
  end
end
