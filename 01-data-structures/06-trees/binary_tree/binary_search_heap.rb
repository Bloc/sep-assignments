require_relative 'node'

class BinarySearchHeap
  attr_reader :root

  def search_for_empty(root, node)
    new_kids = []
    root.each do |kid|
      if kid.left.nil? || kid.right.nil?
        return kid
      else
        new_kids << kid.left
        new_kids << kid.right
      end
    end
    self.search_for_empty(new_kids, node) unless new_kids.empty?
  end

  def search_for_parent_of_last(root)
    new_kids = []
     previous_kid = @root if previous_kid.nil? # I had to add this and figured it out myself right away! Yay! Be proud of me!
    root.each do |kid|
      if kid.left.nil? && kid.right.nil?
        return previous_kid
      elsif kid.left.nil? || kid.right.nil?
        return kid
      else
        new_kids << kid.left
        new_kids << kid.right
      end
      previous_kid = kid
    end
    unless new_kids.empty?
      parent_of_last = self.search_for_parent_of_last(new_kids)
      if parent_of_last.nil?
        # puts root[-1].rating
        return root[-1]
      else
        return parent_of_last
      end
    end
  end


  def check_values(root)
    new_kids = []
    change = false
    root.each do |kid|
      if !kid.left.nil? && kid.left.rating < kid.rating
        temp_rating = kid.rating
        temp_title = kid.title
        kid.title = kid.left.title
        kid.rating = kid.left.rating
        kid.left.title = temp_title
        kid.left.rating = temp_rating
        if @root.title == temp_title
          @root.title = kid.title
          @root.rating = kid.rating
        end
        change = true
      end

      if !kid.right.nil? && kid.right.rating < kid.rating
        temp_rating = kid.rating
        temp_title = kid.title
        kid.title = kid.right.title
        kid.rating = kid.right.rating
        kid.right.title = temp_title
        kid.right.rating = temp_rating
        if @root.title == temp_title
          @root.title = kid.title
          @root.rating = kid.rating
        end
        change = true
      end

      new_kids << kid.left unless kid.left.nil?
      new_kids << kid.right unless kid.right.nil?
    end
    if !new_kids.empty?
      self.check_values(new_kids)
    elsif change == true
      self.check_values([@root])
    end
  end

  def insert(root, node) #wondering about using data vs node says to use node...but can't figure out how to do it with just "data" I guess I'd need both the title and the rating in the data and then make the node...
    if root.nil? && @root.nil?
      @root = node
    else
      target = search_for_empty([root], node) #find empty node and direction
      if target.left.nil?  #insert new node
        target.left = node
      else
        target.right = node
      end
      check_values([root])
    end
  end

  def delete(root, rating)

    target = find(root, rating)
    unless target.nil?

      last_parent = search_for_parent_of_last([root])
      # puts last_parent.rating
      if last_parent.right.nil?
        last_node = last_parent.left
        last_parent.left = nil
      else
        last_node = last_parent.right
        last_parent.right = nil
      end

      target.title = last_node.title
      target.rating = last_node.rating

      check_values([@root])
    end
  end

  def find_parent(root, rating)
    new_kids = []
    root.each do |kid|
      if (!kid.left.nil? && kid.left.rating == rating) ||
         (!kid.right.nil? && kid.right.rating == rating)
        return kid
      else
        new_kids << kid.left unless kid.left.nil?
        new_kids << kid.right unless kid.right.nil?
      end
    end
    self.find_parent(new_kids, rating) unless new_kids.empty?
  end

  def find(root, rating)
    if @root.rating == rating
      return @root
    else
      self.search_kids([root], rating)
    end
  end

  def search_kids(kids, rating)
    new_kids = []
    kids.each do |kid|
      unless rating < kid.rating
        if !kid.left.nil? && kid.left.rating == rating
          return kid.left
        elsif !kid.right.nil? && kid.right.rating == rating
          return kid.right
        else
          new_kids << kid.left unless kid.left.nil?
          new_kids << kid.right unless kid.right.nil?
        end
      end
    end
    search_kids(new_kids, rating) unless new_kids.empty?
  end

  def print(children=nil)
    if children.nil?
      puts @root.title + ": " + @root.rating.to_s
      children = [@root.left, @root.right]
      print(children)
    else
      new_kids = []
      children.each do |kids|
        puts kids.title + ": " + kids.rating.to_s
        unless kids.left.nil?
          new_kids << kids.left
        end
        unless kids.right.nil?
          new_kids << kids.right
        end
      end
      unless new_kids.empty?
        print(new_kids)
      end
    end
  end
end
