//
//  ViewController.swift
//  taskProject
//
//  Created by نجود  on 25/03/1443 AH.
//

import UIKit
struct Task{
    var name = ""
//    var checked = false
    
    
    
}

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , AddTask{
   
    
   
    var tasks : [Task] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        tasks.append(Task(name : "Test object "))
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! task
        cell.addTask.text = tasks[indexPath.row].name
//        if tasks[indexPath.row].checked{
//            cell.checkButton.setBackgroundImage( <#UIImage?#>, for: UIControlState.normal)
//
//        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VC = segue.destination as! addViewController
        VC.delegate = self
       
    }
    func addTask(name: String) {
        tasks.append(Task(name :  name))
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            tasks.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}

