//
//  ViewController.swift
//  Budget Tracker App
//
//  Created by Andrey Pereslavtsev on 10.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountLabel: UILabel!
    
    var balanceAmount = 4_000_000.00
    
    fileprivate func updateAmountLabel() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
//        formatter.numberStyle = .decimal
//        formatter.maximumFractionDigits = 2
//        formatter.minimumFractionDigits = 2
        formatter.currencySymbol = "☭ "
        amountLabel.text = formatter.string(from: NSNumber(value: balanceAmount))!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAmountLabel()
    }


}

