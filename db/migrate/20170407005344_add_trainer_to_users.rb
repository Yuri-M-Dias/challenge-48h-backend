class AddTrainerToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :trainer, foreign_key: {to_table: :users}
  end
end
