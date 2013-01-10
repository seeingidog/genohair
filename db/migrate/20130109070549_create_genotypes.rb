class CreateGenotypes < ActiveRecord::Migration
  def change
    create_table :genotypes do |t|
      t.string :person_id
      t.string :snp_id
      t.string :data

      t.timestamps
    end
  end
end
