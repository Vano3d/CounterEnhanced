//
//  ViewController.swift
//  CounterEnhanced
//
//  Created by Ivan Ch on 11.05.2023.
//

import UIKit


extension Date {
    func getLocalDateInString() -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy HH:mm:ss")
        let dateString = formatter.string(from: now)
        return dateString
    }
}

class ViewController: UIViewController {
    private let historyCleared = "значение сброшено"
    private let historyReduced = "значение изменено на -1"
    private let historyIncreased = "значение изменено на +1"
    private let historyTryToZero = "попытка уменьшить значение счётчика ниже 0"
    
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var historyTextView: UITextView!
    @IBOutlet weak private var clearButton: UIButton!
    @IBOutlet weak private var buttonPlus: UIButton!
    @IBOutlet weak private var buttonMinus: UIButton!
    
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
        buttonMinus.tintColor = .blue
        buttonPlus.tintColor = .red
        clearButton.setTitle("Обнулить", for: .normal)
        clearButton.tintColor = .darkGray
        historyTextView.text = "История изменений:\n"
    }
    
    private func updateCounterLabel() {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    private func getCurrentTime() -> String {
        return Date().getLocalDateInString()
    }
    
    @IBAction private func clickClearButton(_ sender: Any) {
        counter = 0
        updateCounterLabel()
        historyTextView.text += "\n\(getCurrentTime()): \(historyCleared)"
    }
    
    @IBAction private func clickButtonMinus(_ sender: Any) {
        guard counter > 0 else {
            historyTextView.text += "\n\(getCurrentTime()): \(historyTryToZero)"
            return
        }
        counter -= 1
        updateCounterLabel()
        historyTextView.text += "\n\(getCurrentTime()): \(historyReduced)"
    }
    
    @IBAction private func clickButtonPlus(_ sender: Any) {
        counter += 1
        updateCounterLabel()
        historyTextView.text += "\n\(getCurrentTime()): \(historyIncreased)"
    }
}
