//
//  EmployeeTableViewCell.swift
//  CoreDataDemo
//
//  Created by Haidar Bhatti on 23/02/2023.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var imageEmployee: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
