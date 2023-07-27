//
//  MenuVC.swift
//  SplitViewControllerExample
//
//  Created by LingXiao Dai on 2023/7/27.
//

import UIKit

class MenuVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menu"

        let tableView = UITableView(frame: .zero, style: .plain)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.top.bottom.right.equalToSuperview()
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 70
        
    }
    


}

extension MenuVC: UITableViewDelegate {
    
}

extension MenuVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Option \(indexPath.row)"
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
        let vc = DetailVC()
        vc.title = "Option \(indexPath.row)"
//        splitViewController?.showDetailViewController(vc, sender: self)
        showDetailViewController(vc, sender: self)
        
//        guard let detailNavi = splitViewController?.viewControllers.last as? DetailNavigationCtrl else {
//            return
//        }
//        let vc = DetailVC()
//        vc.title = "Option \(indexPath.row)"
//        if splitViewController?.isCollapsed == true {
//            detailNavi.pushViewController(vc, animated: true)
//        } else {
//            detailNavi.setViewControllers([vc], animated: false)
//        }
        
        
//        detailNavi.pushViewController(vc, animated: true)
       
        
    }
    
    
}
