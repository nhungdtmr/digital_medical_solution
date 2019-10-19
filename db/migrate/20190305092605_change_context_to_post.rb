class ChangeContextToPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :content, :text, limit: 4.gigabytes - 1
  end
end
