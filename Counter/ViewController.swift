//
//  ViewController.swift
//  Counter
//
//  Created by Владислав Горелов on 25.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var setToZeroButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var progressTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = "0"
        plusButton.tintColor = .red
        minusButton.tintColor = .blue
        setToZeroButton.tintColor = .gray
        progressTextView.layer.cornerRadius = 12
        progressTextView.contentInsetAdjustmentBehavior = .always

    }

    @IBAction func counterPlus(_ sender: Any) {
        counter += 1
        counterLabel.text = "\(counter)"
        addProgressText("+1")
    }

    @IBAction func counterMinus(_ sender: Any) {
        if counter > 0 {
        counter -= 1
        counterLabel.text = "\(counter)"
        addProgressText("-1")
        scrollToBottom()
        } else {
            progressTextView.text.append("\(getCurrentDateTime())Попытка уменьшить значение счётчика ниже 0 \n")
            scrollToBottom()
        }
    }

    @IBAction func counterToZero(_ sender: Any) {
        counter = 0
        counterLabel.text = "\(counter)"
        progressTextView.text.append("\(getCurrentDateTime())Значение сброшено \n")
        scrollToBottom()
    }

    private var counter: Int = 0
 
    private func addProgressText(_ change: String) {
            let text = "\(getCurrentDateTime())Значение изменено на \(change)\n"
        let currentText = progressTextView.text ?? ""
            progressTextView.text = "\(currentText)\(text)"
        scrollToBottom()
        }

    private func scrollToBottom() { //добавляет автоскролл, когда текст выходит за границы обозначенной области
        if progressTextView.text.isEmpty { return }
        let bottomRange = NSRange(location: progressTextView.text.count - 1, length: 1)
        progressTextView.scrollRangeToVisible(bottomRange)
    }

    func getCurrentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "\ndd-MM-yyyy HH:mm:ss \n"
        return formatter.string(from: Date())
    }


}


