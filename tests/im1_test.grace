dialect "StaticTyping"

type T = interface { m → Number }

def o:T is readable = object {
    method m → Number { 5 }
}