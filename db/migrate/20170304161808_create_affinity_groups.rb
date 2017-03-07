class CreateAffinityGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :affinity_groups, id: :uuid do |t|
      t.uuid :consumer_id
      t.uuid :brand_id

      t.timestamps
    end

    add_index :affinity_groups, [:consumer_id, :brand_id], unique: true
  end
end
