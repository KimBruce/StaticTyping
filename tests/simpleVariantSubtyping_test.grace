dialect "minitest"
import "lexer" as lexer
import "parser" as parser
import "ast" as ast
import "util" as util
import "io" as io
import "SharedTypes" as sh
import "ObjectTypeModule" as ot
import "identifierresolution" as ir
import "StaticTyping" as st
import "ScopeModule" as sm

//Declare types such that types C and D are subtypes of type A

def input : String =
    "type A = String | Number\n"++
    "type B = String | Boolean\n"

//Turns input into an abstract syntax tree (ast)
util.lines.addAll(input)
def tokens = lexer.lexString(input)
def module = parser.parse(tokens)
def inputTree = ir.resolve(module)

//Returns a list of AstNodes corresponding to each type
def nodes = inputTree.value

//Turns type nodes into ObjectTypes so the type checker can process them
def typeNodeA : ast.AstNode = nodes.at(1)
def typeNodeB : ast.AstNode = nodes.at(2)

inputTree.accept(st.astVisitor)

def A : ot.ObjectType = ot.anObjectType.fromDType(typeNodeA.value) with (emptyList)
def B : ot.ObjectType = ot.anObjectType.fromDType(typeNodeB.value) with (emptyList)

print("{A.isSubtypeOf(B)}")
print("{B.isSubtypeOf(A)}")
print("{A.isSubtypeOf(B)}")
print("{B.isSubtypeOf(A)}")