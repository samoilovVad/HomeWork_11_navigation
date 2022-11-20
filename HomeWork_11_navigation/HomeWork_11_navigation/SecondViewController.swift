//
//  SecondViewController.swift
//  HomeWork_11_navigation
//
//  Created by Vadim Samoilov on 12.11.22.
//

import UIKit

class SecondViewController: UIViewController, UpdatingDataController {
    
    var updatingData: String = ""
    
    @IBOutlet weak var dataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextFieldData(with: updatingData)

    }
    
    private func updateTextFieldData(with text: String) {
        dataTextField.text = text
    }
    
    @IBAction func saveDataWithProperty(_ sender: UIButton) {
        navigationController?.viewControllers.forEach({ viewController in
            (viewController as? FirstViewController)?.updatedData = dataTextField.text ?? ""
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toFirstScreen": prepareFirstScreen(segue)
        default: break
        }
    }
    
    private func prepareFirstScreen(_ segue: UIStoryboardSegue) {
        guard let destination = segue.destination as? FirstViewController else {return}
        destination.updatedData = dataTextField.text ?? ""
    }
}
