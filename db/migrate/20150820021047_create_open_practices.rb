class CreateOpenPractices < ActiveRecord::Migration
  def change
    create_table :open_practices do |t|
      t.string :league_name
      t.string :league_website
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :venue
      t.string :cost
      t.boolean :monday
      t.time :monday_start
      t.time :monday_end
      t.boolean :tuesday
      t.time :tuesday_start
      t.time :tuesday_end
      t.boolean :wednesday
      t.time :wednesday_start
      t.time :wednesday_end
      t.boolean :thursday
      t.time :thursday_start
      t.time :thursday_end
      t.boolean :friday
      t.time :friday_start
      t.time :friday_end
      t.boolean :saturday
      t.time :saturday_start
      t.time :saturday_end
      t.boolean :sunday
      t.time :sunday_start
      t.time :sunday_end
      t.string :venue
      t.string :practice_contact
      t.string :submission_contact
      t.boolean :approved, default: false
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
  end
end
