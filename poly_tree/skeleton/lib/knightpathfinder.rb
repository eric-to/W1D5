require_relative '00_tree_node'

class KnightPathFinder
  
  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    build_move_tree(@root_node)
  end
  
  def self.valid_moves(pos)
    x, y = pos
    possible_moves = []
    (-2..2).each do |i|
      (-2..2).each do |j|   
        unless i.abs == j.abs || i == 0 || j == 0
          possible_moves << [x + i, y + j]
        end
      end
    end
    possible_moves.select {|x,y| x > 0 && y > 0}
  end
  
  def build_move_tree(root)
    
  end
  
  def find_path
  end
end

test = KnightPathFinder.new(0)
