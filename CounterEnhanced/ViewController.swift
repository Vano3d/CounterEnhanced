//
//  ViewController.swift
//  CounterEnhanced
//
//  Created by Ivan Ch on 11.05.2023.
//

import UIKit

// Настройка вывода даты в нужном формате
extension Date {
    func localDate() -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy HH:mm:ss")
        let dateString = formatter.string(from: now)
        return dateString
    }
}

class ViewController: UIViewController {
// текстовые константы
    let historyCleared = "значение сброшено"
    let historyReduced = "значение изменено на -1"
    let historyIncreased = "значение изменено на +1"
    let historyTryToZero = "попытка уменьшить значение счётчика ниже 0"
    
    @IBOutlet weak var labelCount: UILabel!
    @IBOutlet weak var historyText: UITextView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    
    var count = 0
// функция обновляет счётчик в label
    func updateLabel() {
        labelCount.text = "Значение счётчика: \(count)"
    }
    
    
// функция вызывает текущую дату и время
    func currTime() -> String {
        return Date().localDate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
// хотел сюда настройки вставить, но передумал
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
//настройка внешнего вида View
        updateLabel()
        buttonMinus.tintColor = .blue
        buttonPlus.tintColor = .red
        clearButton.setTitle("Обнулить", for: .normal)
        clearButton.tintColor = .darkGray
        historyText.text = "История изменений:\n"
    }
    @IBAction func clickClearButton(_ sender: Any) {
        count = 0
        updateLabel()
        historyText.text += "\n\(currTime()): \(historyCleared)"
    }
    
    @IBAction func clickButtonMinus(_ sender: Any) {

        guard count > 0 else {
            historyText.text += "\n\(currTime()): \(historyTryToZero)"
            return
        }
        count -= 1
        updateLabel()
        historyText.text += "\n\(currTime()): \(historyReduced)"
    }
    
    @IBAction func clickButtonPlus(_ sender: Any) {
        count += 1
        updateLabel()
        historyText.text += "\n\(currTime()): \(historyIncreased)"
    }
    
    
}


