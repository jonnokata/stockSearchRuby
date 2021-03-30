class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.string :stockSymbol
      t.string :stockName
      t.boolean :favourited
      t.timestamps
    end
  end
end
