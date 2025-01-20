class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.date :date
      t.string :references
      t.string :user

      t.timestamps
    end
  end
end
