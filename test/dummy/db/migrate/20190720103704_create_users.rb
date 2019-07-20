class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :title
      t.string :email
      t.string :camel_field

      t.timestamps
    end
  end
end
