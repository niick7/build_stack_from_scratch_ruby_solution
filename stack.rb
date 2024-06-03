class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

# Remember pop and push in stack is constant time! It means O(1)
class Stack
  attr_accessor :first, :last, :size

  def initialize
    @first = nil
    @last = nil
    @size = 0
  end

  # Push to the beginning of stack
  # [1]
  # [2, 1]
  # [3, 2, 1]
  def push(val)
    new_node = Node.new(val)
    if @size == 0
      @first = new_node
      @last = new_node
    else
      old_first = @first
      new_node.next = old_first
      @first = new_node
    end
    @size += 1

    @size
  end

  # Remove from the beginning of stack
  # [3, 2, 1]
  # [2, 1]
  # [1]
  # null
  def pop
    return nil if @size == 0

    old_first = @first
    if @size == 1
      @first = nil
      @last = nil
    else
      @first = old_first.next
    end
    @size -= 1

    old_first.value
  end
end

stack = Stack.new
stack.push(1)
stack.push(2)
stack.push(3)
puts stack
puts stack.pop