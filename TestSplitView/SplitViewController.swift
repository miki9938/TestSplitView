//
//  ViewController.swift
//  TestSplitView
//
//  Created by mbujok on 30.01.2018.
//  Copyright © 2018 xtm. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            preferredDisplayMode = .allVisible
        }

        self.presentsWithGesture = true
    }

}

