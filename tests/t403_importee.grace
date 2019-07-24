dialect "StaticTyping"

type T = {
    m -> T
    n -> Number
}

def t: T is public = object {
    type U = {
        n -> String
    }

    method m -> T {
        self
    }

    method n -> Number {
        47
    }
}