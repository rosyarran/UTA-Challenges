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

def is_infinite(list)
  hare = list.next_node
  tortoise = list
  
  while tortoise && hare && hare.next_node
    hare = hare.next_node
    hare = hare.next_node
    tortoise = tortoise.next_node
    
    if hare == tortoise
      return true
    end
  end
  return false
end

node1 = LinkedListNode.new(10)
node2 = LinkedListNode.new(20, node1)
node3 = LinkedListNode.new(30, node2)
node1.next_node = node3

#inf = is_infinite(node3)
#puts "#{inf}"

if !is_infinite(node3)
  print_list(node3)

  puts "------"

  revlist = reverse_list(node3)

  print_list(revlist)
else
  puts "Loop is infinite"
end
  