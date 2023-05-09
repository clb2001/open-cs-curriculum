def naturals():
    """A generator function that yields the infinite sequence of natural
    numbers, starting at 1.

    >>> m = naturals()
    >>> type(m)
    <class 'generator'>
    >>> [next(m) for _ in range(10)]
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    """
    i = 1
    while True:
        yield i
        i += 1

# 在迭代生成器时，每一次执行都可以保留上一次的状态，
# 而不是像普通方法那样，遇到 return 就返回结果，下一次执行只能再次重复上一次的流程
def scale(it, multiplier):
    """Yield elements of the iterable it scaled by a number multiplier.

    >>> m = scale([1, 5, 2], 5)
    >>> type(m)
    <class 'generator'>
    >>> list(m)
    [5, 25, 10]

    >>> m = scale(naturals(), 2)
    >>> [next(m) for _ in range(5)]
    [2, 4, 6, 8, 10]
    """
    "*** YOUR CODE HERE ***"
    # i = 0
    # while it:
    #     it[i] = it[i] * multiplier
    #     yield it[i]
    #     i += 1
    for i in it:
        yield i * multiplier

def hailstone(n):
    """
    >>> for num in hailstone(10):
    ...     print(num)
    ...
    10
    5
    16
    8
    4
    2
    1
    """
    "*** YOUR CODE HERE ***"
    yield n
    while (n != 1):
        if (n % 2 == 0):
            yield n // 2
            n = n // 2
        else:
            yield 3 * n + 1
            n = 3 * n + 1

