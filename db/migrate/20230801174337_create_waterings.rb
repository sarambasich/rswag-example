class CreateWaterings < ActiveRecord::Migration[7.0]
	def change
		create_table :waterings do |t|
			t.datetime :timestamp, null: false
			t.decimal :quantity, null: false
			t.string :method, null: false
			t.belongs_to :plant, index: true, foreign_key: true

			t.timestamps
		end
	end
end
