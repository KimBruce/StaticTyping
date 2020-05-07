dialect "standard"
import "lexer" as lexer
import "parser" as parser
import "ast" as ast
import "util" as util
import "StaticTyping" as st
import "ObjectTypeModule" as ot
import "identifierresolution" as ir
import "ScopeModule" as sc
import "SharedTypes" as share

def input : String =
    "type A = \{\n" ++
    "   m -> String\n" ++
    "   n -> Number\n" ++
    "}\n" ++
    "type B = \{\n" ++
    "   m -> String\n" ++
    "}\n" 

// Turns input into an abstract syntax tree (ast)
util.lines.addAll(input)
def tokens = lexer.lexString(input)
def module = parser.parse(tokens)

// Returns a list of AstNodes
def nodes  = module.value

def Anode = nodes.at(1)
def Bnode = nodes.at(2)

def AOT: share.ObjectType = ot.anObjectType.fromDType(Anode.value) with (list.empty)
def BOT: share.ObjectType = ot.anObjectType.fromDType(Bnode.value) with (list.empty)

print ("1: " ++ AOT.isSubtypeOf(BOT))
print ("2: " ++ BOT.isSubtypeOf(AOT))
print ("3: " ++ (BOT == AOT))
print ("4: " ++ AOT.isSubtypeOf(AOT))
