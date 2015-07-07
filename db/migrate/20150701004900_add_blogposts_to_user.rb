class AddBlogpostsToUser < ActiveRecord::Migration
  def change
    add_reference :blogposts, :user, index: true, foreign_key: true
  end
end
