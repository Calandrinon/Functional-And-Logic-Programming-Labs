class Node:
    def __init__(self, element):
        self.element = element
        self.next = None
    
class MyList:
    def __init__(self):
        self.head = None


def create_list():
    my_list = MyList()
    my_list.head = create_list_recursively()
    return my_list 


def create_list_recursively():
    x = int(input("x="))
    if x == 0:
        return None
    else:
        node = Node(x)
        node.next = create_list_recursively()
        return node


def is_empty(my_list):
    if my_list.head == None:
        return True
    return False

    
def print_list(list):
    print_list_recursively(list.head)

    
def print_list_recursively(node):
    if node != None:
        print(node.element)
        print_list_recursively(node.next)
        
"""
11.
a. Determine if a certain element is member in a list.
b. Determine the length of a list.
"""

        
        
def is_member(my_list, element):
    if is_empty(my_list):
        return False
    
    if my_list.head.element == element:
        return True 

    new_list_parameter = MyList() 
    new_list_parameter.head = my_list.head.next 
    return is_member(new_list_parameter, element)


def list_length(my_list):
    if is_empty(my_list):
        return 0

    new_list_parameter = MyList() 
    new_list_parameter.head = my_list.head.next 
    return 1 + list_length(new_list_parameter)


def test():
    list = create_list()
    print_list(list)

    member = is_member(list, 5)
    if member == True:
        print("5 is a member of the list.")
    else:
        print("5 is not a member of the list.")

    length = list_length(list)
    print("The length of the list is {}.".format(length))

test()

