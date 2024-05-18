//
//  ViewController.swift
//  Egg Timmer
//
//  Created by Ayush Rajpal on 17/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timmer_label: UITextField!
    @IBOutlet weak var text_lable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        timmer_label.text = "Your Timmer will Start..."
        
    }
    let eggTimes = ["Soft": 3,"Medium": 4,"Hard": 7]
    var secondsPasses = 0
    var totalSeconds = 0
    var timer = Timer()
    
    @IBAction func button_pressed(_ sender: UIButton) {
        timer.invalidate()
        secondsPasses = 0
        
        let hardness = sender.currentTitle!
        text_lable.text = hardness
        totalSeconds = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
       
    }
    
    @objc func updateCounter() {
        if secondsPasses < totalSeconds {
            timmer_label.text = "\(secondsPasses + 1) seconds passed..."
            secondsPasses += 1
            let percentProgress = Float(secondsPasses) / Float(totalSeconds)
            progressBar.progress = Float(percentProgress)
        }
        else{
            timer.invalidate()
            text_lable.text = "DONE!!"
        }
        
    }

    

}

