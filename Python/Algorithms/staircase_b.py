def create_staircase(nums):
    step = 1
    subsets = []
    while len(nums) != 0:
        if len(nums) >= step:
            subsets.append(nums[0:step])
            print(subsets)
            nums = nums[step:]
            step += 1
        else:
            print("false")
            return False
        
    print(subsets)
    return subsets
    
arr1 = [1, 2, 3, 4, 5, 6]

arr2 = [1, 2, 3, 4, 5, 6, 7]

create_staircase(arr2)