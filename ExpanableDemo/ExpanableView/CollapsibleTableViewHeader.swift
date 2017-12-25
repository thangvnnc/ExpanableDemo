//
//  CollapsibleTableViewHeader.swift
//  ExpanableDemo
//
//  Created by ThangSIC on 12/25/17.
//  Copyright © 2017 ThangSIC. All rights reserved.
//

import UIKit

protocol CollapsibleTableViewHeaderDelegate
{
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int)
}

class CollapsibleTableViewHeader: UITableViewHeaderFooterView
{
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var arrowLabel: UILabel!
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0
    
    static let nibName: String = String.init(describing: CollapsibleTableViewHeader.self)
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        //
        // Call tapHeader when tapping on this header
        //
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CollapsibleTableViewHeader.tapHeader(_:))))
        // Initialization code
    }
    
    //
    // Trigger toggle section when tapping on the header
    //
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer)
    {
        guard let cell = gestureRecognizer.view as? CollapsibleTableViewHeader else
        {
            return
        }
        
        delegate?.toggleSection(self, section: cell.section)
    }
    
    func setCollapsed(_ collapsed: Bool)
    {
        //
        // Animate the arrow rotation (see Extensions.swf)
        //
        arrowLabel.rotate(collapsed ? 0.0 : .pi / 2)
    }
    
}
