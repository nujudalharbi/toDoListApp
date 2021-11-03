//
//  editTask.swift
//  taskProject
//
//  Created by نجود  on 27/03/1443 AH.
//

import UIKit

protocol EditTask {
    func editTask(name : String)
}

class editTask: UIViewController {

    
    
    @IBOutlet weak var editTextField : UITextField!
    
    var delegate: EditTask!
    var ourTask : String!
    var indexItem : Int!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
       
        editTextField.text = ourTask
    }


    @IBAction func update(_ sender: Any) {
        delegate.editTask(name: editTextField.text!)
        navigationController?.popViewController(animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
