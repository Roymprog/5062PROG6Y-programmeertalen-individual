import sys


def get_all_values(mylist):
    if not isinstance(mylist, (list, range)):
        raise Exception('This function should only be called with a list as parameter')

    n = len(mylist)

    if (n == 0):
        return False

    return range(1, n + 1)


def opgave1(mylist):
    all_values = get_all_values(mylist)

    return all([x in mylist for x in all_values])


def opgave2(mylist):
    all_values = get_all_values(mylist)

    return (n for n in list(filter(lambda x: x not in mylist, all_values)))


def opgave3a(filename):
    grid = []
    with open(filename) as f:
        for line in f:
            row = []
            string = line.strip()
            for char in string:
                if char != ' ':
                    row.append(int(char))
            grid.append(row)
    return grid


def opgave3b(mylist):
    for row in mylist:
        for x in row:
            sys.stdout.write(str(x) + " ")
        print("")


def opgave3(filename):
    opgave3b( opgave3a( filename ) )


def sum_nested_it(mylist):
    som = 0
    for x in mylist:
        if hasattr(x, "__iter__"):
            mylist.extend(x)
        elif isinstance(x, int):
            som = som + x
    return som