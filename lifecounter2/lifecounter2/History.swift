//
//  History.swift
//  lifecounter2
//
//  Created by Srinidhi Balaraman on 4/26/22.
//

import UIKit

//class TableData : UITableViewDataSource {
//
//}

class History: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var historyTable: UITableView!
    var cells: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(cells)
        historyTable.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Prototype", for: indexPath)
                
           // Configure the cell’s contents with the row and section number.
           // The Basic cell style guarantees a label view is present in textLabel.
        cell.textLabel!.text = cells[indexPath.row]
        return cell
    }
}
