class LinkedListNode
  attr_accessor :value, :next_node
  
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_list(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_list(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(list, prev=nil)
  current = list
  
  while current != nil
    temp = current.next_node
    current.next_node = prev
    prev = current
    current = temp
  end
  
  list = prev
  list
end

node1 = LinkedListNode.new(10)
node2 = LinkedListNode.new(20, node1)
node3 = LinkedListNode.new(30, node2)

print_list(node3)

puts "------"

revlist = reverse_list(node3)

print_list(revlist)