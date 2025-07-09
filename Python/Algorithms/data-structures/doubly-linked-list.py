from Node import Node
from LinkedList import LinkedList


num_list = LinkedList()

node_a = Node(14)
node_b = Node(2)
node_c = Node(20)
node_d = Node(31)
node_e = Node(16)
node_f = Node(55)

num_list.append(node_a)  # Add 14
num_list.append(node_b)   # Add 2, make the tail
num_list.append(node_c)  # Add 20, make the tail

num_list.prepend(node_d)  # Add 31, make the head

num_list.insert_after(node_b, node_e)  # Insert 16 after 2
num_list.insert_after(node_c, node_f)  # Insert 55 after tail, 55 becomes new tail

# Output list
print('List after adding nodes:', end=' ')
node = num_list.head
while node != None:
    print(node.data, end=' ')
    node = node.next
print()

num_list.remove(node_f)  # Remove the tail
num_list.remove(node_d)  # Remove the head


# Output final list
print('List after removing nodes:', end=' ')
node = num_list.head
while node != None:
    print(node.data, end=' ')
    node = node.next
print()