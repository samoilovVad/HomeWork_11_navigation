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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateData(with: updatedData)
    }


    @IBAction func editDataWithProperty(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let second = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? UpdatingDataController else { return }
        second.updatingData = (sender as? UIButton)?.titleLabel?.text ?? ""
        navigationController?.pushViewController(second as! UIViewController, animated: true)
    }
    
    @IBAction func unwindToFirstScreen(_ segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toEditScreen" : prepareEditScreen(segue)
        default: break
        }
    }
    
    private func updateData(with text: String) {
        dataLabel.text = text
    }
    
    private func prepareEditScreen(_ segue: UIStoryboardSegue) {
        guard let destination = segue.destination as? SecondViewController else {return}
        destination.updatingData = dataLabel.text ?? ""
    }
}

