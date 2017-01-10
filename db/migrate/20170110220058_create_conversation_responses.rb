class CreateConversationResponses < ActiveRecord::Migration
  def change
    create_table :conversation_responses do |t|
      t.text :statement
      t.string :trigger

      t.timestamps null: false
    end
  end
end
