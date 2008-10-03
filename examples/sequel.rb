# Raw select, print out each row.
DB['select * from posts'].each {|row| p row }

# Get a handle for a table
posts = DB[:posts]

# Restrict results using a filter
filtered = posts.filter :category => ['ruby', 'postgres']

# Post Model
class Post < Sequel::Model
  many_to_one :author

  validates do
    presence_of :title
  end
end

# Find post with title 'hello world'
post = Post[:title => 'hello world']