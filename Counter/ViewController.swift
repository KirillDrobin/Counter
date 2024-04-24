//
//  ViewController.swift
//  Counter
//
//  Created by Кирилл Дробин on 21.04.2024.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var counterPlus: UIButton!
    
    @IBOutlet weak var counterMinus: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var historyView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        counterLabel.text = "0"
        
        historyView.text = "История изменений: \n \n"
        
                
}
    //функция вывода текущей даты, времени
    func dateTime() -> String {
        let dateTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy, HH:mm:ss"
        let currentDateTime = dateFormatter.string(from: dateTime)
        return currentDateTime
    }
    
    //функция автоскролла
    func autoScroll() {
        historyView.contentOffset = CGPoint(x: 0, y: historyView.contentSize.height - historyView.frame.size.height)
    }
    
    // начальное значение счетчика
    var counter = 0

    // увеличение счетчика на +1
    @IBAction func counterAppend(_ sender: Any) {
 
        counter += 1
        
        counterLabel.text = "Значение счетчика: \(counter)"
        
        historyView.text += "\(dateTime()): значение изменено на +1 \n \n"
        
        autoScroll()
    }
    
    // уменьшение счетчика на -1
    @IBAction func counterSubtrac(_ sender: Any) {
        
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
    @IBAction func resetCount(_ sender: Any) {
        
        counter = 0
        counterLabel.text = "Значение счетчика: \(counter)"
        
        historyView.text += "\(dateTime()): значение сброшено \n \n"
        
        autoScroll()
    }
    
}


