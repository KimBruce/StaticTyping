dialect "StaticTyping"

import "im1_test" as im1 is public

def p: im1.T is public = object {
    method m → Number { im1.o.m }
}

print("{p.m}")