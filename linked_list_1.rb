class LinkedListNode
  attr_accessor :value, :next_node
  
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_reader :data
  
  def initialize
    @data = nil
  end
  
  def push(value)
    @data = LinkedListNode.new(value, @data)
  end
  
  def pop
    if @data.nil?
      puts "EMPTY"
    end
    value = @data.value
    @data = @data.next_node
    value
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

def reverse_list(list)
  new_list = Stack.new
  
  while list
    new_list.push(list.value)
    list = list.next_node
  end
  
  LinkedListNode.new(new_list.pop, new_list.data)
  
end

node1 = LinkedListNode.new(10)
node2 = LinkedListNode.new(20, node1)
node3 = LinkedListNode.new(30, node2)

print_list(node3)

puts "------"

revlist = reverse_list(node3)

print_list(revlist)