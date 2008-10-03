class Post < Sequel::Model
  set_schema do
    primary_key :id
    text :title
    text :category
    foreign_key :author_id, :table => :authors
  end
end