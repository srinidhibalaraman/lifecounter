//
//  ViewController.swift
//  LifeCounter
//
//  Created by Srinidhi Balaraman on 4/19/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
   
    @IBOutlet weak var minusButton2: UIButton!
    @IBOutlet weak var plusButton2: UIButton!
    @IBOutlet weak var scoreLabel2: UILabel!
        
    @IBOutlet weak var loserLabel: UILabel!
    
    
    
    let dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loserLabel.isHidden = true
        scoreLabel.text = "\(dataSource.score)"
        scoreLabel2.text = "\(dataSource.score2)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func minusButtonDidTouchUpInside(_ sender: Any) {
        dataSource.decreaseScore()
        scoreLabel.text = "\(dataSource.score)"
        checkScore()
    }
    
    @IBAction func plusButtonDidTouchUpInside(_ sender: Any) {
        dataSource.increaseScore()
        scoreLabel.text = "\(dataSource.score)"
        checkScore()
    }

    @IBAction func plusFiveButtonDidTouchUpInside(_ sender: Any) {
        dataSource.increaseScoreFive()
        scoreLabel.text = "\(dataSource.score)"
        checkScore()
    }
    
    @IBAction func minusFiveButtonDidTouchUpInside(_ sender: Any) {
        dataSource.decreaseScoreFive()
        scoreLabel.text = "\(dataSource.score)"
        checkScore()
    }
    
    @IBAction func minusButton2DidTouchUpInside(_ sender: Any) {
        dataSource.decreaseScore2()
        scoreLabel2.text = "\(dataSource.score2)"
        checkScore2()
    }
    
    @IBAction func plusButton2DidTouchUpInside(_ sender: Any) {
        dataSource.increaseScore2()
        scoreLabel2.text = "\(dataSource.score2)"
        checkScore2()
    }
    
    @IBAction func minusFiveButton2DidTouchUpInside(_ sender: Any) {
        dataSource.decreaseScoreFive2()
        scoreLabel2.text = "\(dataSource.score2)"
        checkScore2()
    }
    
    @IBAction func plusFiveButton2DidTouchUpInside(_ sender: Any) {
        dataSource.increaseScoreFive2()
        scoreLabel2.text = "\(dataSource.score2)"
        checkScore2()
    }
    
    func checkScore() {
        if dataSource.score < 1 {
            loserLabel.isHidden = false
            loserLabel.text = "Player 1 LOSES!"
        }
    }
    
    func checkScore2() {
        print("I am inside checkScore2")
        if dataSource.score2 < 1 {
            print("I am less than 1")
            loserLabel.isHidden = false
            loserLabel.text = "Player 2 LOSES!"
        }
    }
}

