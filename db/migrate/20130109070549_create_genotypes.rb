class CreateGenotypes < ActiveRecord::Migration
  def change
    create_table :genotypes do |t|
      t.integer :person_id
      t.integer :snp_id
      t.string :data

      t.timestamps
    end
  end
end
