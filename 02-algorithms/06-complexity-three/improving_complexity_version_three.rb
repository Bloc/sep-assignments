require_relative 'node.rb'

def sort_list(head_node)
  return head_node if head_node.nil? || head_node.next.nil?

  middle_node = middle_node(head_node)
  middle_node.next = nil
  merge(sort_list(head_node), sort_list(head_of_second_half)
end

def merge(list_one, list_two)
  merged_list = Node.new
  
  if list_one.data <= list_two.data
    merged_list = list_one
    merged_list.next = merge(list_one.next, list_two)
  else
    merged_list = list_two
    merged_list.next = merge(list_one, list_two.next)
  end
  return merged_list
end

def middle_node(head_node)
  first_pointer = head_node
  second_pointer = head_node.next

  while first != nil
    second_pointer = second_pointer.next
    if second_pointer != nil
      first_pointer = first_pointer.next
      second_pointer = second_pointer.next
    end
  end
  first_pointer
end
