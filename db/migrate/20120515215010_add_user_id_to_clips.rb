class AddUserIdToClips < ActiveRecord::Migration
  def change
    add_column :clips, :user_id, :integer
  end
end
