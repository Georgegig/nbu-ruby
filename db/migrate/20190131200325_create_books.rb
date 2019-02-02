class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :author
      t.string :title
      t.string :genere
      t.text :description
      t.text :isbn_number
      t.datetime :publish_date
    end
  end
end
