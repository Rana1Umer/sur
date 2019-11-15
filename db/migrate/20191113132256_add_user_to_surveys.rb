class AddUserToSurveys < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :user_id, :integer, foriegn_key: true, index: true
  end
end
