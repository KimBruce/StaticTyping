dialect "minitest"
import "lexer" as lexer
import "parser" as parser
import "ast" as ast
import "util" as util
import "io" as io
import "SharedTypes" as sh
import "ObjectTypeModule" as ot
import "StaticTyping" as st
import "ScopeModule" as sm

def input : String =
    "type A = String | Number\n"++
    "type B = String | Boolean\n"

// Turns input into an abstract syntax tree (ast)
util.lines.addAll(input)
def tokens = lexer.lexString(input)
def module = parser.parse(tokens)

// Returns a list of AstNodes corresponding to each type
def nodes = module.value

// Turns type nodes into ObjectTypes so the type checker can process them
def typeNodeA : ast.AstNode = nodes.at(1)
def typeNodeB : ast.AstNode = nodes.at(2)

def A : ot.ObjectType = ot.anObjectType.fromDType(typeNodeA.value) with (list.empty)
def B : ot.ObjectType = ot.anObjectType.fromDType(typeNodeB.value) with (list.empty)

print("{A.isSubtypeOf(B)}")
print("{B.isSubtypeOf(A)}")
print("{A.isSubtypeOf(B)}")
print("{B.isSubtypeOf(A)}")
