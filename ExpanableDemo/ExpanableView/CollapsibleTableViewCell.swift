//
//  CollapsibleTableViewCell.swift
//  ExpanableDemo
//
//  Created by ThangSIC on 12/25/17.
//  Copyright © 2017 ThangSIC. All rights reserved.
//

import UIKit

class CollapsibleTableViewCell: UITableViewCell
{
    static let nibName: String = String.init(describing: CollapsibleTableViewCell.self)
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() 
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
