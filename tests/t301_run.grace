type A = { one -> Boolean }

type A' = {
    one -> Boolean
    two -> Number
}

type B = { one(b:Boolean) -> Boolean }

type B' = {
    one(b:Boolean) -> Boolean
    two(n:Number) -> Number
}

type B'' = {
    one(b:Boolean) -> Boolean
    two(n1:Number, n2:Number) -> Number
}