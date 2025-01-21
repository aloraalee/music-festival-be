class RenameScheduleItemsToScheduleShows < ActiveRecord::Migration[7.1]
  def change
    rename_table :schedule_items, :schedule_shows

    remove_index :schedule_shows, column: :schedule_id
    remove_index :schedule_shows, column: :show_id
    
    add_index :schedule_shows, :schedule_id
    add_index :schedule_shows, :show_id
  end
end
