# schema/migrations/001_post_migration.rb
class PostMigration < Sequel::Migration
  def up
    create_table :posts do
      primary_key :id
      text :title
      text :category
      foreign_key :author_id, :table => :authors
    end
  end

  def down
    drop_table :posts
  end
end