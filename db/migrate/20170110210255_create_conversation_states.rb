class CreateConversationStates < ActiveRecord::Migration
  def change
    create_table :conversation_states do |t|
      t.text :statement
      t.string :trigger

      t.timestamps null: false
    end
  end
end
