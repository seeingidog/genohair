class AddPersonidsToGenotypes < ActiveRecord::Migration
  def change
    add_column :genotypes, :personid, :string
  end
end
