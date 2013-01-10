class CreateSnps < ActiveRecord::Migration
  def change
    create_table :snps do |t|
      t.string :name
      t.string :description
      t.string :cc
      t.string :cg
      t.string :gg
      t.string :ag
      t.string :aa
      t.string :gt
      t.string :tt
      t.string :ct
      t.string :at

      t.timestamps
    end
  end
end
