//
//  SplitVC.swift
//  SplitViewControllerExample
//
//  Created by LingXiao Dai on 2023/7/27.
//

import UIKit

class SplitVC: UISplitViewController {
    
    private lazy var primaryNaviCtrl = PrimaryNavigationCtrl(rootViewController: MenuVC())
    private lazy var detailNaviCtrl = DetailNavigationCtrl(rootViewController: PlaceholderVC())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferredDisplayMode = .oneBesideSecondary
        
        delegate = self
        
        
        viewControllers = [
            primaryNaviCtrl,
            detailNaviCtrl
        ]

    }
    

    

}

extension SplitVC: UISplitViewControllerDelegate {
    
    // 自动折叠的时候  -> 从常规过渡到紧凑的时候调用
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        print(self.description + #function)
        
        guard
            let primary = primaryViewController as? PrimaryNavigationCtrl,
            let detail = secondaryViewController as? DetailNavigationCtrl
        else {
            return false
        }
        
        let viewControllers = detail.popToRootViewController(animated: false)
        if let viewControllers {
            primary.viewControllers.append(contentsOf: viewControllers)
        }
        
        return true
    }
    
    // 展开的时候 -> 紧凑过渡到常规的时候调用
    func splitViewController(_ splitViewController: UISplitViewController, separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {
        
        print(self.description + #function)
        
        guard let primary = primaryViewController as? PrimaryNavigationCtrl else { return nil }
        
        self.detailNaviCtrl.popToRootViewController(animated: false)

        if let viewControllers = primary.popToRootViewController(animated: false) {
            self.detailNaviCtrl.viewControllers.append(contentsOf: viewControllers)
        }

        return self.detailNaviCtrl
    }
    
    /*
     when call showDetailViewController func, the delegate will be triggered
     */
    func splitViewController(_ splitViewController: UISplitViewController, showDetail vc: UIViewController, sender: Any?) -> Bool {

        print(self.description + #function)
        
        if splitViewController.isCollapsed {
            primaryNaviCtrl.pushViewController(vc, animated: true)
        } else {
            detailNaviCtrl.setViewControllers([vc], animated: false)
        }
        return true
    }
}
