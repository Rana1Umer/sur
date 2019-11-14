class CreateMicrosurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :microsurveys do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
