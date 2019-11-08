class AddUserIdToPosts < ActiveRecord::Migration[5.2]
  def up
    add_reference :posts, :user, null: false, index: true
  end

  def down
    remove_reference :posts, :user, index: true
  end
end
