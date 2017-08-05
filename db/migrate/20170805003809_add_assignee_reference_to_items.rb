class AddAssigneeReferenceToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :assignee, foreign_key: { to_table: 'users' }
  end
end
