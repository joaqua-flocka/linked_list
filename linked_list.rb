class Node
  attr_accessor :value, :next_node
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize(value = nil, next_node = nil)
    @head = next_node
    @value = value
  end

  def append(value)
    if @head == nil
      @head = Node.new(value)
    else
      tmp = @head
      until tmp.next_node == nil
        tmp = tmp.next_node
      end
      tmp.next_node = Node.new(value)
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    count = 0
    tmp = @head
    until tmp == nil
      tmp = tmp.next_node
      count += 1
    end
    count
  end

  def head
    @head
  end

  def tail
    tmp = @head
    until tmp.next_node == nil
      tmp = tmp.next_node
    end
    tmp
  end

  def at(index)
    count = 0
    tmp = @head
    until count == index || tmp == nil
      count += 1
      tmp = tmp.next_node
    end
    tmp
  end

  def pop
    tmp = @head
    until tmp.next_node.next_node == nil
      tmp = tmp.next_node
    end
    tmp.next_node = nil
  end

  def contains?(value)
    tmp = @head
    contains = false
    until tmp == nil || tmp.value == value
      tmp = tmp.next_node
    end
    contains = true unless tmp == nil
    contains
  end

  def find(value)
    tmp = @head
    count = 0
    until tmp.value == value
      tmp = tmp.next_node
      count += 1
    end
    if tmp.value == value
      return count
    end
    return nil
  end

  def to_s
    string = ''
    tmp = @head
    until tmp == nil
      string += "( #{tmp.value} ) -> "
      tmp = tmp.next_node
    end
    string += '( nil )'
    string
  end

  def insert_at(value, index)
    if index == 0
      return prepend(value)
    end
    tmp = @head
    count = 0
    until count == index - 1
      tmp = tmp.next_node
      count += 1
    end
    tmp.next_node = Node.new(value, tmp.next_node)
  end

  def remove_at(index)
    if index == 0
      @head = @head.next_node
      return
    end
    tmp = @head
    count = 0
    until count == index - 1
      tmp = tmp.next_node
      count += 1
    end
    tmp.next_node = tmp.next_node.next_node
  end
end


list = LinkedList.new
arr = [2,5,3,7,4,2,7,8,10]
arr.each {|i| list.append(i)}
list.prepend(13)
list.pop


puts list.to_s
puts list.size
puts list.at(8).value
puts list.contains?(2)
#puts list.find(8)
list.insert_at(34, 9)
puts list.to_s
list.remove_at(9)
puts list.to_s