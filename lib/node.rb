class Node
  attr_reader :point, :parent

  def initialize(point, parent = nil)
    @point = point
    @parent = parent
  end
end
