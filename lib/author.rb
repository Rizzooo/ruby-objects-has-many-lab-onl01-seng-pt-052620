class Author
  attr_accessor :name
  
  @@post_count = 1 
  
  def initialize(name)
    @name = name
    @posts = []
  end
  
  def add_post(posting)
    @posts << posting
    posting.author = self
    @@post_count += 1 
  end
  
  def add_post_by_title(posting)
    posting = Post.new(posting)
    add_post(posting)
  end
  
  def posts
    Post.all.select {|posts| posts.author == self}
  end
  
  def self.post_count
    @@post_count
  end
end