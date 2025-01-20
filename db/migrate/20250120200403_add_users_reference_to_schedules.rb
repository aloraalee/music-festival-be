class AddUsersReferenceToSchedules < ActiveRecord::Migration[7.1]
  def change
    remove_column :schedules, :user
    remove_column :schedules, :references
    add_reference :schedules, :user, foreign_key: true
  end
end
