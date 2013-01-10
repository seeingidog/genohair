class ChangeColumns < ActiveRecord::Migration
  def up
    change_column :genotypes, :person_id, :integer
    change_column :genotypes, :snp_id, :integer
  end

  def down
  end
end
