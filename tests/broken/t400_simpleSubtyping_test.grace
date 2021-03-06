dialect "minitest"
import "lexer" as lexer
import "parser" as parser
import "ast" as ast
import "util" as util
import "io" as io
import "StaticTyping" as st
import "ObjectTypeModule" as ot
import "identifierresolution" as ir
import "SharedTypes" as sh
import "ScopeModule" as sc

def input : String = 
    "type Foo = \{\n" ++
    "    a -> Foo\n" ++
    "    b -> Number\n" ++
    "\}\n" ++
    "type Bar = \{\n" ++
    "    a -> Bar\n" ++
    "\}\n" ++
    "type A = \{\n" ++
    "   m -> Foo" ++
    "\}\n" ++
    "type B = \{\n" ++
    "   m -> Bar" ++
    "\}\n"

// Turns input into an abstract syntax tree (ast)
util.lines.addAll(input)
def tokens = lexer.lexString(input)
def module = parser.parse(tokens)
def inputTree = ir.resolve(module)

// Returns a list of AstNodes corresponding to each testBlock
def nodes = inputTree.value

// inputTree.accept(st.astVisitor)

def typeFoo: ast.AstNode = nodes.at(1)
def typeBar: ast.AstNode = nodes.at(2)
def typeA: ast.AstNode = nodes.at(3)
def typeB: ast.AstNode = nodes.at(4)

def objTypeFoo: sh.ObjectType = ot.anObjectType.fromDType(typeFoo.value) with (emptyList)
def objTypeBar: sh.ObjectType = ot.anObjectType.fromDType(typeBar.value) with (emptyList)
def objTypeA: sh.ObjectType = ot.anObjectType.fromDType(typeA.value) with (emptyList)
def objTypeB: sh.ObjectType = ot.anObjectType.fromDType(typeB.value) with (emptyList)

testSuiteNamed "subtyping tests" with {
    test "simple subtype" by {
        assert(objTypeFoo.isSubtypeOf(objTypeBar)) shouldBe (true)
    }

    test "simple not subtype" by {
        assert(objTypeBar.isSubtypeOf(objTypeFoo)) shouldBe (false)
    }

    test "simple method subtype" by {
        assert(objTypeA.isSubtypeOf(objTypeB)) shouldBe (true)
    }

    test "simple method not subtype" by {
        assert(objTypeB.isSubtypeOf(objTypeA)) shouldBe (false)
    }
}