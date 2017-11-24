//
//  ViewController.swift
//  TodoApp
//
//  Created by Genji on 2017/04/04.
//  Copyright © 2017年 Genji. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var items = [String]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
     
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(ViewController.pushAddButton(sender:)))
        
    }
    
    func pushAddButton(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "タスクを追加", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "タスク名を追加"
        }
        
         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            if let text = alert.textFields?.first?.text {
                self.items.append(text)
                self.tableView.reloadData()
            }
         }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
         present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let index = indexPath.row
        tableView.beginUpdates()
        items.remove(at: index)
        let indexPaths = NSIndexPath(row: indexPath.row, section: indexPath.section)
        tableView.deleteRows(at: [indexPaths as IndexPath], with: .automatic)
        tableView.endUpdates()
        
    }
    
    
    
    


}

