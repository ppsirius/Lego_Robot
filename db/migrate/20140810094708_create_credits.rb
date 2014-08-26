class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :user_id
      t.integer :credit

      t.timestamps
    end
  end
end
