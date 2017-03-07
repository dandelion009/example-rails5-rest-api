class CreateHooks < ActiveRecord::Migration[5.0]
  def change
    create_table :hooks, id: :uuid do |t|
      t.integer :threshold, default: 0
      t.string :callback, null: false

      t.timestamps
    end

    add_index :hooks, :threshold
  end
end
