//
//  AccountViewController.swift
//  TestSplitView
//
//  Created by mbujok on 27.03.2018.
//  Copyright © 2018 xtm. All rights reserved.
//

import UIKit
import SwiftMessages

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onShowPopup(_ sender: Any) {

        let view = MessageView.viewFromNib(layout: MessageView.Layout.centeredView)

        view.configureTheme(.info)
        view.button?.setTitle("Close", for: .normal)
        view.bodyLabel?.text = "moja własna wiadomość"

        SwiftMessages.show(view: view)

    }
}
