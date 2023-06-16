//
//  UserListTableViewCell.swift
//  Virtusa_Task
//
//  Created by Nitu Warjurkar on 16/06/23.
//

import UIKit

class UserListTableViewCell: UITableViewCell {
    
    static let identifier = "UserListTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureData(data: DataModel?) {
        if let userData = data {
            titleLabel.text = userData.title
            subTitleLabel.text = userData.body
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

