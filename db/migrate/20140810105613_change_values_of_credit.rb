class ChangeValuesOfCredit < ActiveRecord::Migration
  def change

  	change_column :credits, :credit, :boolean

  end
end
