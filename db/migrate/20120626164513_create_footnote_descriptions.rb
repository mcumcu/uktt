class CreateFootnoteDescriptions < ActiveRecord::Migration
  def change
    create_table :footnote_descriptions, :id => false do |t|
      t.string :record_code
      t.string :subrecord_code
      t.string :record_sequence_number
      
      t.string :footnote_description_period_sid
      t.string :footnote_type_id
      t.string :footnote_id
      t.string :language_id
      t.text :description

      t.timestamps
    end
  end
end
