class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :name
      t.text :biography
      t.string :gender
      t.string :province
      t.string :interest

      t.timestamps
    end
  end
end
