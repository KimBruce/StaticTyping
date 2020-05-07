dialect "StaticTyping"

type A = {
    id(n: Number) → Number
}

class a(m: Number) → A {
    method id(n: Number) → Number {n + m}
}

def b: A = object  {
    // inherit a(3)
    method id(n: Number) → Number {n + 17}
    method idid -> Number { id (47) }
}

print(b.idid)
