class CreateQuotaDefinitions < ActiveRecord::Migration
  def change
    create_table :quota_definitions, :id => false do |t|
      t.string :record_code
      t.string :subrecord_code
      t.string :record_sequence_number

      t.integer :quota_definition_sid
      t.string :quota_order_number_id
      t.date :validity_start_date
      t.date :validity_end_date
      t.integer :quota_order_number_sid
      t.integer :volume
      t.integer :initial_volume
      t.string :measurement_unit_code
      t.integer :maximum_precision
      t.string :critical_state
      t.integer :critical_threshold
      t.string :monetary_unit_code
      t.string :measurement_unit_qualifier_code
      t.text :description

      t.timestamps
    end
  end
end
