class AddCommentsToBlogposts < ActiveRecord::Migration
  def change
    add_reference :comments, :blogpost, index: true, foreign_key: true
  end
end
