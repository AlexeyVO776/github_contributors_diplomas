class CreateContributors < ActiveRecord::Migration[7.0]
  def change
    create_table :contributors do |t|
      t.string :login
      t.integer :contributions

      t.timestamps
    end
  end
end
