class PolyTreeNode
  
  attr_reader :value, :parent
  
  def initialize(value = nil)
    @value = value
    @parent = nil
    @children = []
  end
  
  def children
    @children
  end
  
  def parent=(parent)
    if self.parent
      self.parent.children.delete(self)
    end
    
    @parent = parent
    return if self.parent.nil?
    self.parent.children << self
  
  end
  
  def add_child(child)
    child.parent = self
    self.children << child unless self.children.include?(child)
  end
  
  def remove_child(child)
    unless child && self.children.include?(child)
     raise "Invalid child"
    end
    child.parent = nil
    self.children.delete(child)
  end
  
  def dfs(target)
    return self if self.value == target
    self.children.each do |child|
      dfs_results = child.dfs(target)
      return dfs_results if dfs_results
    end
    nil
  end
  
  def bfs(target) 
    queue = [self]
    
    while !queue.empty?
      popped = queue.shift
      
      return popped if popped.value == target
      popped.children.each do |child|
        queue.push(child)
        # return child if child.value == target
      end
    end
    nil
  end
  

  
  
  
  
  
  
  
  
  
  

  
  
  # 
  # def bfs(target_value)
  #   queue = [self]
  #   until queue.empty?
  #     first_node = queue.shift
  #     return first_node if first_node.value == target_value
  #     self.children.each do |child|
  #       queue << child
  #     end
  #   end
  # end
end
