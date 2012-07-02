class CreateGoodsNomenclatureGroups < ActiveRecord::Migration
  def change
    create_table :goods_nomenclature_groups, :id => false do |t|
      t.string :record_code
      t.string :subrecord_code
      t.string :record_sequence_number

      t.string :goods_nomenclature_group_type
      t.string :goods_nomenclature_group_id
      t.date :validity_start_date
      t.date :validity_end_date
      t.integer :nomenclature_group_facility_code

      t.timestamps
    end
  end
end
