//
//  ViewController.swift
//  ExpanableDemo
//
//  Created by ThangSIC on 12/25/17.
//  Copyright © 2017 ThangSIC. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var sections = sectionsData
    
    @IBOutlet weak var tbvDemo: UITableView!
    
    static var nidName: String = String(describing: ViewController.self)

    init()
    {
        super.init(nibName: ViewController.nidName, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        let nib: UINib = UINib(nibName: CollapsibleTableViewHeader.nibName, bundle: nil)
        tbvDemo.register(nib, forHeaderFooterViewReuseIdentifier: CollapsibleTableViewHeader.nibName)
        tbvDemo.estimatedRowHeight = 44
        
        let nibCel: UINib = UINib(nibName: CollapsibleTableViewCell.nibName, bundle: nil)
        tbvDemo.register(nibCel, forCellReuseIdentifier: CollapsibleTableViewCell.nibName)
    }
}

extension ViewController: UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sections[section].collapsed ? 0 : sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: CollapsibleTableViewCell =
            tableView.dequeueReusableCell(withIdentifier: CollapsibleTableViewCell.nibName, for: indexPath)
                as! CollapsibleTableViewCell
        
        let item: Item = sections[indexPath.section].items[indexPath.row]
        cell.nameLabel.text = item.name
        cell.detailLabel.text = item.detail
        
        return cell
    }
}

extension ViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let header: CollapsibleTableViewHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: CollapsibleTableViewHeader.nibName) as! CollapsibleTableViewHeader
        
        header.titleLabel.text = sections[section].name
        header.arrowLabel.text = ">"
        header.setCollapsed(sections[section].collapsed)
        
        header.section = section
        header.delegate = self
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 1.0
    }
}

//
// MARK: - Section Header Delegate
//
extension ViewController: CollapsibleTableViewHeaderDelegate
{
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int)
    {
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        
        tbvDemo.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
}
