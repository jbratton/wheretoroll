class CreateDerbyEvents < ActiveRecord::Migration
  def change
    create_table :derby_events do |t|
      t.string :name
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.string :venue
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :host
      t.string :website
      t.string :event_contact
      t.string :cost
      t.boolean :mrda
      t.boolean :wftda
      t.boolean :jrda
      t.boolean :made
      t.boolean :usars
      t.boolean :rdcl
      t.boolean :female
      t.boolean :male
      t.boolean :coed
      t.boolean :preregistration
      t.boolean :spectators
      t.text :general_info
      t.string :submission_contact
      t.boolean :approved, default: false
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
  end
end
