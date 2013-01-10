class AddTokens < ActiveRecord::Migration
  def up
    add_column :people, :token, :string
    add_column :people, :refresh_token, :string
  end

  def down
  end
end
