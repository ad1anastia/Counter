//
//  ViewController.swift
//  Counter
//
//  Created by Nastya Adodina on 18.04.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countTouchLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countTouchLabel.text = "Значение счётчика: \(count)"
        historyTextView.text = "История изменений:\n"
    }
    
    @IBAction func incrementCounter(_ sender: UIButton) {
        count += 1
        updateHistory(with: "Значение изменено на +1")
        updateCounterLabel()
    }
    
    @IBAction func decrementCounter(_ sender: UIButton) {
        if count > 0 {
            count -= 1
            updateHistory(with: "Значение изменено на -1")
        } else {
            updateHistory(with: "Попытка уменьшить значение счётчика ниже 0")
        }
        updateCounterLabel()
    }
    
    @IBAction func resetCounter(_ sender: UIButton) {
        count = 0
        updateHistory(with: "Значение сброшено")
        updateCounterLabel()
    }
    
    private func updateCounterLabel() {
        countTouchLabel.text = "Значение счётчика: \(count)"
      }
    
    private func updateHistory(with changeDescription: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestampString = dateFormatter.string(from: Date.now)
        
        let newEntry = "[\(timestampString)] : \(changeDescription)\n"
        
        historyTextView.text += newEntry
        scrollToBottom()
    }
    
    private func scrollToBottom() {
        let bottom = NSRange(location: historyTextView.text.count - 1, length: 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
}
