//
//  ViewController.swift
//  OzanCheckoutSample
//
//  Created by mkeremkeskin on 21/07/2017.
//  Copyright © 2017 mkeremkeskin. All rights reserved.
//

import UIKit
import OzanCheckout

class ViewController: UIViewController {

    @IBOutlet weak var envPickerView: UIPickerView!
    @IBOutlet weak var apiKeyTextField: UITextField!

    var environments = ["Dev", "QA", "Sandbox", "Production"]

    override func viewDidLoad() {
        super.viewDidLoad()
        OzanCheckoutManager.shared().setEnvironment(EnvDev)

        apiKeyTextField.delegate = self

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @IBAction func presentWebView (sender: UIButton) {

        OzanCheckoutManager.shared().setPublicApiKey(apiKeyTextField.text!)
        OzanCheckoutManager.shared().setLocale(localeRU)
        OzanCheckoutManager.shared().ozanCheckoutManagerDelegate = self

        let checkoutObject = CheckoutObject.init(amount: 61.98, andCurrency: "EUR", andMerchantName: "")
        OzanCheckoutManager.shared().presentCheckoutScreen(self, withCheckoutInfo: checkoutObject)
    }

    @IBAction func pushWebView (sender: UIButton) {

        OzanCheckoutManager.shared().setPublicApiKey(apiKeyTextField.text!)
        OzanCheckoutManager.shared().setLocale(localeRU)
        OzanCheckoutManager.shared().ozanCheckoutManagerDelegate = self

        let checkoutObject = CheckoutObject.init(amount: 61.98, andCurrency: "EUR", andMerchantName: "")
        OzanCheckoutManager.shared().pushCheckoutScreen(toNavigation: self.navigationController!, withCheckoutInfo: checkoutObject)
    }

    func dismissKeyboard() {
        view.endEditing(true)
    }

}

extension ViewController:  OzanCheckoutManagerDelegate  {

    func authenticationSuccessful() {
        print("YAYYY! You are logged in!")
    }

    func errorOccured(_ checkoutErrorModel: CheckoutErrorModel) {
        print("Ooops something is wrong here is your message: " + checkoutErrorModel.errorMessage)
    }

    func paymentTokenReceived(_ paymentToken: String) {
        print("Payment is finished. Here is your token: " + paymentToken)
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return environments.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return environments[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(row == 0) {
            OzanCheckoutManager.shared().setEnvironment(EnvDev)
        }
        else if(row == 1) {
            OzanCheckoutManager.shared().setEnvironment(EnvQA)
        }
        else if(row == 2) {
            OzanCheckoutManager.shared().setEnvironment(EnvSandbox)
        }
        else {
            OzanCheckoutManager.shared().setEnvironment(EnvProduction)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        apiKeyTextField.resignFirstResponder()
        return true
    }
}

