//
//  ViewController.swift
//  Demo_carsh
//
//  Created by Mini001 on 2023/3/28.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        if #available(iOS 14, *) {
            WidgetTool.refreshWidget()
        }
        
    }


}

func deviceIsiPad() -> Bool {
    return UIDevice.current.userInterfaceIdiom == .pad
}

