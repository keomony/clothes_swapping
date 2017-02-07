class AddUserRefToSelectors < ActiveRecord::Migration[5.0]
  def change
    add_reference :selectors, :user, foreign_key: true
  end
end
