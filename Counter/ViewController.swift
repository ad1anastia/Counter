//
//  ViewController.swift
//  Counter
//
//  Created by Nastya Adodina on 18.04.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countTouchLabel: UILabel!
    @IBOutlet weak var counterButton: UIView!
    
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countTouchLabel.text = "Значение счётчика: \(count)"
    
    }

    @IBAction func buttonTapped(_ sender: Any) {
        count += 1
        countTouchLabel.text = "Значение счётчика: \(count)"
    }
}
