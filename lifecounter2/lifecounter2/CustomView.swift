//
//  CustomView.swift
//  lifecounter2
//
//  Created by Srinidhi Balaraman on 4/25/22.
//

import UIKit

class CustomView: UIView {

    var delegate: playerInfoProtocol?
    
    var score = 20
    
    var subBy = 5
    var addBy = 5
    
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var lifeLabel: UILabel!
    
    
    var num : (Int) = 0 {
        didSet {
            playerLabel.text = "Player " + String(num + 1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            addSubView()
    }
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            addSubView()
    }
    
    private func addSubView() {
        let customView =
          Bundle.main.loadNibNamed("CustomView",
                                   owner: self,
                                   options: nil)?.first as! UIView
          addSubview(customView)
    }

    @IBAction func subFive(_ sender: Any) {
        score -= subBy
        lifeLabel.text = String(score)
        delegate!.newHistory(player: playerLabel.text!, move: "-", points: subBy)
        delegate!.disablePlayerButtons()
        delegate!.checkScore(player: playerLabel.text!, score: score)
    }
    
    @IBAction func subOne(_ sender: Any) {
        score -= 1
        lifeLabel.text = String(score)
        delegate!.newHistory(player: playerLabel.text!, move: "-", points: 1)
        delegate!.disablePlayerButtons()
        delegate!.checkScore(player: playerLabel.text!, score: score)
    }
    
    
    @IBAction func addOne(_ sender: Any) {
        score += 1
        lifeLabel.text = String(score)
        delegate!.newHistory(player: playerLabel.text!, move: "+", points: 1)
        delegate!.disablePlayerButtons()
        delegate!.checkScore(player: playerLabel.text!, score: score)
    }
    
    
    @IBAction func addFive(_ sender: Any) {
        score += addBy
        lifeLabel.text = String(score)
        delegate!.newHistory(player: playerLabel.text!, move: "+", points: addBy)
        delegate!.disablePlayerButtons()
        delegate!.checkScore(player: playerLabel.text!, score: score)
    }
    
    @IBOutlet weak var subByBtn: UIButton!
    @IBAction func editSubValue(_ sender: Any) {
        let alert = UIAlertController(
            title: "Edit Value",
            message: "Enter the new value to subtract by.",
            preferredStyle: .alert
        )
        alert.addTextField { field in
            field.placeholder = "5"
            field.returnKeyType = .next
            field.keyboardType = .numberPad
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { _ in
            // Read textfield values
            guard let field = alert.textFields, field.count == 1 else {
                return
            }
            let name = alert.textFields?[0].text
            if (Int(name!) != nil) {
                self.subByBtn.setTitle("-" + name!, for: .normal)
                self.subBy = Int(name!)!
            }
        }))
        delegate?.present(viewControllerToPresent: alert, animated: true)
    }
    
    @IBOutlet weak var addByBtn: UIButton!
    @IBAction func editAddValue(_ sender: Any) {
        let alert = UIAlertController(
            title: "Edit Value",
            message: "Enter the new value to add by.",
            preferredStyle: .alert
        )
        alert.addTextField { field in
            field.placeholder = "5"
            field.returnKeyType = .next
            field.keyboardType = .numberPad
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Enter", style: .default, handler: { _ in
            // Read textfield values
            guard let field = alert.textFields, field.count == 1 else {
                return
            }
            let name = alert.textFields?[0].text
            if (Int(name!) != nil) {
                self.addByBtn.setTitle("+" + name!, for: .normal)
                self.addBy = Int(name!)!
            }
        }))
        delegate?.present(viewControllerToPresent: alert, animated: true)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
