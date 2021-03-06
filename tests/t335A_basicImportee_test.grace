dialect "StaticTyping"


type NumberCopy = Number
type MyType = { a -> Number }

class myClass -> MyType {
    method a -> Number { 47 }
}

def myDef : String is public = "Mini"

var myVar : String is public := "Grace"

method myMeth -> Number { 47 }

method myMethWithParam(myParam : interface{
    m(param : MyType) -> Number
    n -> String
}) -> String { myParam.n }

method myConfidentialMeth -> Number is confidential { 47 }

// ********* ampersand and variant

type FirstHalf  = { firstMeth -> Number }
type SecondHalf = { secondMeth -> Number }

type AmpersandType = FirstHalf & SecondHalf
type VariantType   = FirstHalf | SecondHalf
