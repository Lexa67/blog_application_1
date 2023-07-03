class AddStatusToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :status_post, :integer, default: 'aproved'
  end
end
