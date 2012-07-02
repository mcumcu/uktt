class CreateFtsRegulationActions < ActiveRecord::Migration
  def change
    create_table :fts_regulation_actions, :id => false do |t|
      t.string :record_code
      t.string :subrecord_code
      t.string :record_sequence_number
      
      t.integer :fts_regulation_role
      t.string :fts_regulation_id
      t.integer :stopped_regulation_role
      t.string :stopped_regulation_id

      t.timestamps
    end
  end
end
