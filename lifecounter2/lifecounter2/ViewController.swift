//
//  ViewController.swift
//  lifecounter2
//
//  Created by Srinidhi Balaraman on 4/25/22.
//

import UIKit

protocol playerInfoProtocol {
    func newHistory(player: String, move: String, points: Int)
    func checkScore(player: String, score: Int)
    func present(viewControllerToPresent: UIAlertController, animated: Bool)
    func disablePlayerButtons()
}

class ViewController: UIViewController, playerInfoProtocol {
    
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var addPlayerBtn: UIButton!
    @IBOutlet weak var subPlayerBtn: UIButton!
    @IBOutlet weak var loserLabel: UILabel!
    
    var history: [String] = []
    
    var playersAlive = 4
    var numPlayers = 4
    
    var currPlayers: [CustomView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loserLabel.isHidden = true
        
        for i in 0...3 {
            createPlayer(playerNum: i)
        }
    }
    
    func disablePlayerButtons() {
        addPlayerBtn.isEnabled = false
        subPlayerBtn.isEnabled = false
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        print("This is unwinding")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("I am here")
        if segue.identifier == "History",
           let History = segue.destination as? History {
            History.cells = history
            print(history)
        }
    }
    
    func newHistory(player : String, move : String, points : Int) {
        var res = player
        if move == "+" {
            res += " received " + String(points) + " life."
        } else if move == "-" {
            res += " lost " + String(points) + " life."
        } else {
            res += " LOSES!"
        }
        
        history.append(res)
    }
    
    func checkScore(player : String, score : Int) {
        if score <= 0 {
            loserLabel.text = "\(player) LOSES!"
            loserLabel.isHidden = false
            newHistory(player: player, move: "nil", points: score)
            playersAlive -= 1
        }
    }
    
    func createPlayer(playerNum : Int) {
        let newPlayer = CustomView()
        newPlayer.num = (playerNum)
        newPlayer.delegate = self
        currPlayers.append(newPlayer)
        stackView.addArrangedSubview(newPlayer)
    }

    
    @IBAction func addPlayer(_ sender: Any) {
        createPlayer(playerNum: playersAlive)
        playersAlive += 1
        numPlayers += 1
        
        if numPlayers == 8 {
            addPlayerBtn.isEnabled = false
        }
        
        if numPlayers != 2 {
            subPlayerBtn.isEnabled = true
        }
    }
    
    
    @IBAction func subPlayer(_ sender: Any) {
        print(currPlayers)
        numPlayers -= 1
        for i in 0...(currPlayers.count - 1) {
            print(i)
            if currPlayers[i].num == numPlayers {
                currPlayers[i].removeFromSuperview()
                currPlayers.remove(at: i)
            }
        }
        
        playersAlive -= 1
        
        if numPlayers != 8 {
            addPlayerBtn.isEnabled = true
        }
        
        if numPlayers == 2 {
            subPlayerBtn.isEnabled = false
        }
    }
    
    func present(viewControllerToPresent: UIAlertController, animated flag: Bool) {
        self.present(viewControllerToPresent, animated: flag, completion: nil)
    }
    
}

