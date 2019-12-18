//
//  ViewController.swift
//  AddMinusCount
//
//  Created by Javier Calderon Jr. on 12/17/19.
//  Copyright © 2019 SelfLearning. All rights reserved.
//

import UIKit

struct ItemType {
    var name: String
    var count: Int
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var listArray: [ItemType] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.generateData()
    }
    
    //Function to generate data to populate
    func generateData() {
        self.listArray = []
        for i in 0 ..< 10 {
            self.listArray.append(ItemType(name: "Item Number: \(i)", count: 0))
        }
        self.tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell") as! ItemTableViewCell
        
        cell.nameLabel.text = self.listArray[indexPath.row].name
        cell.countLabel.text = "\(self.listArray[indexPath.row].count)"
        
        cell.incrementButton.tag = indexPath.row
        cell.incrementButton.addTarget(self, action: #selector(self.incrementItem(_:)), for: .touchUpInside)
        
        cell.decrementButton.tag = indexPath.row
        cell.decrementButton.addTarget(self, action: #selector(self.decrementItem(_:)), for: .touchUpInside)
        
        return cell
    }
    
    //Function to increment item count
    @objc func incrementItem(_ sender: UIButton) {
        let currentCount = self.listArray[sender.tag].count
        self.listArray[sender.tag].count = currentCount + 1
        if let currentCell = self.tableView.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as? ItemTableViewCell {
            currentCell.countLabel.text = "\(self.listArray[sender.tag].count)"
        }
    }
    
    //Function to decrement item count
    @objc func decrementItem(_ sender: UIButton) {
        let currentCount = self.listArray[sender.tag].count
        if !(currentCount - 1 >= 0) {
            //Usually item count will not be negative value
            return
        }
        self.listArray[sender.tag].count = currentCount - 1
        if let currentCell = self.tableView.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as? ItemTableViewCell {
            currentCell.countLabel.text = "\(self.listArray[sender.tag].count)"
        }
    }
    
}
