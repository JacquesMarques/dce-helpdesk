class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :title, null: false
      t.text :content
      t.string :status, null: false, default: 'active'
      t.references :user, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: false

      t.timestamps
    end
  end
end
