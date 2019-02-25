import collections


def opgave1(mylist):
    if not isinstance(mylist, (list, range)):
        raise Exception('This function should only be called with a list as parameter')

    n = len(mylist)

    if (n == 0):
        return False

    all_values = (range(1, n + 1))
    return all([ x in mylist for x in all_values ])

def opgave2(mylist):
    pass

def opgave3a(filename):
    pass

def opgave3b(mylist):
    pass

def opgave3(filename):
    opgave3b( opgave3a( filename ) )

def sum_nested_it(mylist):
    pass
