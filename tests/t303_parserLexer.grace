dialect "minitest"
import "lexer" as lexer
import "parser" as parser
import "ast" as ast
import "util" as util
import "io" as io
import "SharedTypes" as sh
import "ObjectTypeModule" as ot
import "identifierresolution" as ir

//Declare types such that types C and D are subtypes of type A
def input : String =
    "type Foo = \{ a -> Foo\}\n" ++
    "type Bar = \{\n" ++
    "    a -> Bar\n" ++
    "    b -> Number\n" ++
    "\}\n" ++
    "class bar -> Bar \{\n" ++
    "    method a -> Bar \{ self \}\n" ++
    "    method b -> Number \{ 0 \}\n" ++
    "\}\n" ++
    "def test : Foo = bar\n"

//Turns input into an abstract syntax tree (ast)
util.lines.addAll(input)
def tokens = lexer.lexString(input)
def module = parser.parse(tokens)
def inputTree = ir.resolve(module)

print("\ninputTree: {inputTree.value}")

for(inputTree.value) do { inputTreeValue ->
    print("\ninputTreeValue: {inputTreeValue}")
}

print("\nmodule: {module.value}")

for(module.value) do { moduleValue ->
    print("\nmoduleValue: {moduleValue}")
}


//Returns a list of AstNodes corresponding to each type
def nodes  = inputTree.value

//Turns type nodes into ObjectTypes so the type checker can process them
def typeFoo: ast.AstNode = nodes.at(1)
def typeBar: ast.AstNode = nodes.at(2)
def classbar: ast.AstNode = nodes.at(3)
def deftest: ast.AstNode = nodes.at(4)