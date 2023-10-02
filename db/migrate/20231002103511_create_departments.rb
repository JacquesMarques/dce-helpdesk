class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.string :status, null: false, default: 'active'

      t.timestamps
    end
  end
end
