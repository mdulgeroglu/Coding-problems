# Escape char: \
# Operators: +-*/ 
# from math import *


# Variables

# Text Type: 			str
# Numeric Types: 		int, float, complex
# Sequence Types: 		list, tuple, range
# Mapping Type: 		dict
# Set Types: 			set, frozenset
# Boolean Type: 		bool
# Binary Types: 		bytes, bytearray, memoryview


print("Hello " + y)
name = input("enter name") sting by def


x = 4
y = "John"
z = True

#basic string functions
.lower()
.upper()
.isupper()
len()
[]				// [2], [2:4]
.index()
.replace()

#basic num functions
# p = int, var
str()	 # str(p) 			converts input to string
int()	 # int(p) 			converts input to int
float()	 # float(p) 		converts input to float
abs()	 # abs(p) 			gives abs val of int
pow()	 # pow(p1, p1) 		gives p1^p2 | opt p3 is %
max()	 # max(p1, p2...) 	gives max v | can set def= | key=len etc
min()	 # min(p) 			gives min v | can set def= | key=len etc
round()	 # round(p, n) 		gives rounded p tp nth digit


#lists
#mutable, indexed
list1 = ["Joe", "Bob", "Mike", 2, True]

print(list1[1:3])

.append() 	# list.append("Jack") adds item to end of list
.insert() 	# list.insert(1, "Jack") adds item to the indexed pos pushing others right
.remove() 	# list.remove("joe" OR list[1]) removes item from list
.clear() 	# list.clear() removes all items from list
.pop() 		# list.pop(1 OR def is -1) removes item from list
.index()	# list.index() gives index of item in list
.count()	# list.count() gives num of ocurrences of item in list
.sort()		# list.sort() sorts list | reverse=True, key=myFunc
.reverse()	# list.reverse() reverses order of list
.copy()		# list2 = list1.copy() copies list to new var


#tuples
#immutable, indexed

tup1 = (5, 6)

# list of tuples
list3 = [(5, 28), (54, 8), (3, 1)]


#functions

def func1():
	print("Hello")


#if
cond = True
---
if x>2:
	statement
else:
	statement
---
if cond and cond2:
	print("yes")
elif cond or cond2:
	print("maybe")
elif cond1 and not(cond2):
	print("maybe2")
else:
	print("no")

#while
i = 1
while i <= 10:
	print(i)
	i += 1
print("done")




correctWord = "hello"

while attempt < 3:
	while guess != correctWord:
		guess = input("Enter guess: ")
		attempt += 1
	print("you won!")
print("you lost!")






































