//
//  task.swift
//  taskProject
//
//  Created by نجود  on 25/03/1443 AH.
//

import UIKit

class task: UITableViewCell {

    @IBOutlet weak var checkTask: UIImageView!
    
    @IBOutlet weak var addTask: UILabel!
    
    //var ischeck = false
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
