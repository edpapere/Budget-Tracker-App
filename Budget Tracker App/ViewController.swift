//
//  ViewController.swift
//  Budget Tracker App
//
//  Created by Andrey Pereslavtsev on 10.11.2020.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets (balance)
    @IBOutlet weak var amountLabel: UILabel?
    
    // MARK: - Outlets (loan calc)
    @IBOutlet weak var monthlyPaymentLabel: UILabel?
    @IBOutlet weak var nperTextField: UITextField? // term
    @IBOutlet weak var pvTextField: UITextField? // amount
    @IBOutlet weak var rateTextField: UITextField? // interest rate
    
    // MARK: - Properties
    var balanceAmount = 4_000_000.00
    
    // MARK: - Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    fileprivate func updateAmountLabel() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
//        formatter.numberStyle = .decimal
//        formatter.maximumFractionDigits = 2
//        formatter.minimumFractionDigits = 2
        formatter.currencySymbol = "☭ "
        amountLabel?.text = formatter.string(from: NSNumber(value: balanceAmount))!
    }
    
    func updateMonthlyPaymentLabel() {
        guard let nper = Double(nperTextField?.text ?? "") else { return }
        guard let pv = Double(pvTextField?.text ?? "") else { return }
        guard let rate = Double(rateTextField?.text ?? "") else { return }
        
        let monthlyPayment = abs(ExcelFormulas.pmt(rate: rate/100/12, nper: nper, pv: pv))
        
//        monthlyPaymentLabel?.text = String(monthlyPayment)
        monthlyPaymentLabel?.text = monthlyPayment.asCurrency()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAmountLabel()
    }

    @IBAction func loanParamChanged(_ sender: UITextField) {
        print(sender.text ?? "nil")
        updateMonthlyPaymentLabel()
    }
    
}

