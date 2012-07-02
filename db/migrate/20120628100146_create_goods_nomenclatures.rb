class CreateGoodsNomenclatures < ActiveRecord::Migration
  def change
    create_table :goods_nomenclatures, :id => false do |t|
      t.string :record_code
      t.string :subrecord_code
      t.string :record_sequence_number
      
      t.integer :goods_nomenclature_sid
      t.string :goods_nomenclature_item_id
      t.string :producline_suffix
      t.date :validity_start_date
      t.date :validity_end_date
      t.integer :statistical_indicator

      t.timestamps
    end
  end
end
