//
//  ViewController.swift
//  HomeWork_11_navigation
//
//  Created by Vadim Samoilov on 12.11.22.
//

import UIKit

class FirstViewController: UIViewController {
    
    var updatedData: String = "Test data"

    @IBOutlet weak var dataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData(with: updatedData)
    }


    @IBAction func editDataWithProperty(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let second = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? UpdatingDataController else { return }
        second.updatingData = dataLabel.text ?? ""
        navigationController?.pushViewController(second as! UIViewController, animated: true)
    }
    
    private func updateData(with text: String) {
        dataLabel.text = text
    }
}

