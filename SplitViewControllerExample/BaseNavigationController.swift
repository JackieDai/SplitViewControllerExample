//
//  BaseViewController.swift
//  SplitViewControllerExample
//
//  Created by LingXiao Dai on 2023/7/27.
//

import UIKit


class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        applyBarTintColorToTheNavigationBar()
    }
    
    /// Configures the navigation bar to use a custom color as its background. The navigation bar remains translucent.
    func applyBarTintColorToTheNavigationBar() {
        /*  Be aware when selecting a barTintColor for a translucent bar that
            the tint color will be blended with the content passing under
            the translucent bar.  See QA1808 for more information.
            <https://developer.apple.com/library/ios/qa/qa1808/_index.html>
        */
        let darkendBarTintColor = #colorLiteral(red: 0.5541667552, green: 0.7134873905, blue: 0.5476607554, alpha: 1)
    
        /** Use the appearance proxy to customize the appearance of UIKit elements.
            However changes made to an element's appearance proxy do not affect any existing instances of that element currently
            in the view hierarchy. Normally this is not an issue because you will likely be performing your appearance customizations in
             -application:didFinishLaunchingWithOptions:. However, this example allows you to toggle between appearances at runtime
            which necessitates applying appearance customizations directly to the navigation bar.
        */
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
        standardAppearance.backgroundColor = darkendBarTintColor
        
        let compactAppearance = standardAppearance.copy()

        let navBar = self.navigationBar
        navBar.standardAppearance = standardAppearance
        navBar.scrollEdgeAppearance = standardAppearance
        navBar.compactAppearance = compactAppearance // For iPhone small navigation bar in landscape.
        if #available(iOS 15.0, *) { // For compatibility with earlier iOS.
            navBar.compactScrollEdgeAppearance = compactAppearance
        }
    }
}

class PrimaryNavigationCtrl: BaseNavigationController {}

class DetailNavigationCtrl: BaseNavigationController {}
