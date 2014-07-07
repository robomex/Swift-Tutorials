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

import Foundation

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

// 1
import UIKit

// 2
class TestDataSource: NSObject, UITableViewDataSource {
    
    // 3
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    var possibleTips = Dictionary<Int, (tipAmt:Double, total:Double)>()
    var sortedKeys:Int[] = []
    
    // 4
    init() {
        possibleTips = tipCalc.returnPossibleTips()
        sortedKeys = sort(Array(possibleTips.keys))
        super.init()
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return sortedKeys.count
    }
        
    // 1
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        // 2
        let cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
            
        // 3
        let tipPct = sorted[indexPath.row]
            
        // 4
        let tipAmt = possibleTips[tipPct]!.tipAmt
        let total = possibleTips[tipPct]!.total
            
        // 5
        cell.textLabel.text = "\(tipPct)%:"
        cell.detailTextLabel.text = String(format:"Tip: $%0.2f, Total: $%0.2f", tipAmt, total)
        return cell
    }
    
}


let testDataSource = TestDataSource()
let tableView = UITableView(frame:CGRect(x: 0, y: 0, width: 320, height: 320), style: .Plain)
tableView.dataSource = testDataSource
tableView.reloadData()
