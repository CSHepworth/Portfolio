# An individual item with a weight and value
class Item:
    def __init__(self, item_weight, item_value):
        self.weight = item_weight
        self.value = item_value
        self.fraction = 1.0

# The knapsack that contains a list of items and a maximum
# total weight
class Knapsack:
    def __init__(self, weight, items):
        self.max_weight = weight
        self.item_list = items

# A key function to be used to sort the items
def value_to_weight_ratio(item):
    return item.value / item.weight

# The Fractional Knapsack algorithm.    
def fractional_knapsack(knapsack, item_list):
    # Sort the items in descending order based on value/weight
    item_list.sort(key = value_to_weight_ratio, reverse = True)

    remaining = knapsack.max_weight
    for item in item_list:
        # Check if the full item can fit into the knapsack or
        # only a fraction
        if item.weight <= remaining:
            # The full item will fit. 
            knapsack.item_list.append(item)
            remaining = remaining - item.weight

        else:
            # Only a fractional part of the item will fit. Add that
            # fraction of the item, and then exit.
            item.fraction = remaining / item.weight
            knapsack.item_list.append(item)
            break