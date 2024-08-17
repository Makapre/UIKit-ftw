//
//  TableVC.swift
//  UIKit ftw
//
//  Created by Marius Preikschat on 13.08.24.
//

import UIKit

class TableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = .systemBackground
        tableView.separatorColor = .systemRed
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        
//        // if the content scrolls under the tabbar
//        if let tabBarController = tabBarController {
//            tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: tabBarController.tabBar.frame.height, right: 0.0);
//        }

        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        250
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.titleLabel.text = "This is row \(indexPath.row)"
//        cell.badge.text = indexPath.row > 99 ? "99+" : String(indexPath.row)
        cell.badge.text = String(indexPath.row)
        return cell
    }
    
    internal func tableView(
        _ tableView: UITableView,
        contextMenuConfigurationForRowAt indexPath: IndexPath,
        point: CGPoint
    ) -> UIContextMenuConfiguration? {
        
        let previewProvider = {
            let vc = PreviewVC()
            let index = indexPath.row
            vc.index = index
            return index % 2 == 0 ? vc : nil
        }
        return UIContextMenuConfiguration(identifier: nil, previewProvider: previewProvider) { _ in
            let inspectAction = UIAction(
                title: NSLocalizedString("InspectTitle", comment: ""),
                image: UIImage(systemName: "arrow.up.square")
            ) { _ in }
            let deleteAction = UIAction(
                title: NSLocalizedString("DeleteTitle", comment: ""),
                image: UIImage(systemName: "trash"),
                attributes: .destructive
            ) { _ in }
            return UIMenu(title: "This is a context menu", children: [inspectAction, deleteAction])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

#Preview {
    TableVC()
}
