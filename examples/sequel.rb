# Raw select, print out each row.
DB['select * from posts'].each {|row| p row }

# Get a handle for a table
posts = DB[:posts]

# Restrict results using a filter
filtered = posts.filter(:category => ['ruby', 'postgres'])

# Post Model
class Post < Sequel::Model
  many_to_one :author

  validates do
    presence_of :title
  end
end

# Find post with title 'hello world'
post = Post[:title => 'hello world']

# Add an index
DB.add_index :posts, [:author, :title], :unique => true

# Insert a new record
DB[:posts] << {:title => 'Awesome post', :body => 'LOL'}

# Union selects
DB[:items].union(DB[:other_items]).sql
#=> "SELECT * FROM items UNION SELECT * FROM other_items"

# Its like... SQL or something ;)
DB[:items].
  select(:x, :y, :z).
  filter((:x > 1) & (:y > 2)).
  order(:z.desc).
  sql
  
#=> "SELECT `x`, `y`, `z` FROM `items` 
#     WHERE ((`x` > 1) AND (`y` > 2)) ORDER BY `z` DESC"