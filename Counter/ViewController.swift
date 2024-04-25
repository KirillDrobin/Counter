//
//  ViewController.swift
//  Counter
//
//  Created by Кирилл Дробин on 21.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var counter = 0 // начальное значение счетчика
    
    @IBOutlet weak private var counterLabel: UILabel!
    
    @IBOutlet weak private var counterPlus: UIButton!
    
    @IBOutlet weak private var counterMinus: UIButton!
    
    @IBOutlet weak private var resetButton: UIButton!
    
    @IBOutlet weak private var historyViewLabel: UILabel!
    
    @IBOutlet weak private var historyView: UITextView!
    
    @IBOutlet weak private var clearHistory: UIButton!
    
    //начальный экран
    override internal func viewDidLoad() {
        
        counterLabel.text = "0"
        historyView.text = ""
        
        //рамка для поля истории
        var borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        historyView.layer.borderWidth = 2.5
        historyView.layer.borderColor = borderColor.cgColor
        historyView.layer.cornerRadius = 19.0
        
        super.viewDidLoad()
    }
    
    //функция вывода текущей даты, времени
    private func dateTime() -> String {
        let dateTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy, HH:mm:ss"
        let currentDateTime = dateFormatter.string(from: dateTime)
        return currentDateTime
    }
    
    //функция автоскролла
    private func autoScroll() {
        historyView.contentOffset = CGPoint(x: 0, y: historyView.contentSize.height - historyView.frame.size.height)
    }
    
    // увеличение счетчика на +1
    @IBAction private func counterPlus1(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счетчика: \(counter)"
        historyView.text += "\(dateTime()): значение изменено на +1 \n \n"
        autoScroll()
    }
    
    // уменьшение счетчика на -1
    @IBAction private func counterMinus1(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            historyView.text += "\(dateTime()): значение изменено на -1 \n \n"
        } else {
            historyView.text += "\(dateTime()): попытка уменьшить значение счётчика ниже 0 \n \n"
        }
        counterLabel.text = "Значение счетчика: \(counter)"
        autoScroll()
    }
    
    // обнуление счетчика
    @IBAction private func resetCount(_ sender: Any) {
        counter = 0
        counterLabel.text = "Значение счетчика: \(counter)"
        historyView.text += "\(dateTime()): значение сброшено \n \n"
        autoScroll()
    }
    
    //функция очистки поля истории
    @IBAction private func clear(_ sender: Any) {
        historyView.text = ""
    }
}


