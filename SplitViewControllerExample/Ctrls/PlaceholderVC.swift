//
//  PlaceholderVC.swift
//  SplitViewControllerExample
//
//  Created by LingXiao Dai on 2023/7/27.
//

import UIKit

class PlaceholderVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Placeholder"
        
        let label = UILabel()
        label.backgroundColor = .red
        label.text = title
        label.textAlignment = .center
        
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.left.top.equalTo(200)
            make.bottom.right.equalTo(-200)
            
        }
    }
    


}
