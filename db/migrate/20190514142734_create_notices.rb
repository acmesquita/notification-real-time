class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.string :body
      t.references :sender
      t.references :recipient
      t.timestamps
    end
    add_foreign_key :notices, :users, column: :sender_id, primary_key: :id
    add_foreign_key :notices, :users, column: :recipient_id, primary_key: :id
  end
end
