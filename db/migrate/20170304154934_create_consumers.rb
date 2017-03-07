class CreateConsumers < ActiveRecord::Migration[5.0]
  def change
    create_table :consumers, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
