class CreateTagTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_tickets do |t|
      t.integer :tag_id, :ticket_id
      t.timestamps
    end
  end
end
