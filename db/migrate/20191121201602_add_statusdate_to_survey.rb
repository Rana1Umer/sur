class AddStatusdateToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :status, :string
    add_column :surveys, :due_date, :date
  end
end
