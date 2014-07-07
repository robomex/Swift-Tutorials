// Ray Wenderlich Tutorial 3 - Playground

/*
let tipAndTotal = (4.00, 25.19)

tipAndTotal.0
tipAndTotal.1

let (theTipAmt, theTotal) = tipAndTotal
theTipAmt
theTotal

let tipAndTotalNamed = (tipAmt: 4.00, total: 25.19)
tipAndTotalNamed.tipAmt
tipAndTotalNamed.total


let total = 21.19
let taxPct = 0.06
let subtotal = total / (taxPct + 1)
func calcTipWithTipPct(tipPct:Double) -> (tipAmt: Double, total:Double) {
    let tipAmt = subtotal * tipPct
    let finalTotal = total + tipAmt
    return (tipAmt, finalTotal)
}
calcTipWithTipPct(0.20)
*/

class TipCalculatorModel {
    
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total:Double, taxPct:Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct:Double) -> (tipAmt: Double, total: Double) {
        let tipAmt = subtotal * tipPct
        let finalTotal = total + tipAmt
        return(tipAmt, finalTotal)
    }
    
    func returnPossibleTips() -> Dictionary<Int, (Double, Double)> {
        
        let possibleTips = [0.15, 0.18, 0.20]
        
        var retval = Dictionary<Int, (Double, Double)>()
        for possibleTip in possibleTips {
            let intPct = Int(possibleTip*100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}

let tipCalc = TipCalculatorModel(total: 21.19, taxPct: 0.06)
tipCalc.returnPossibleTips()
