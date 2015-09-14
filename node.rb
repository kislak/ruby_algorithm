Node = Struct.new(:payload, :next, :prev)
Node2 = Stuct.new(:payload, :next, :prev, :up, :down)

def create(payload)
  Node.new(payload, nil, nil)
end

def add_after(node, payload)
  new_node = Node.new(payload, node.next, node)
  node.next.prev = new_node if node.next
  node.next = new_node
end

