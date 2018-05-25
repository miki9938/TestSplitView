//
//  DetailsViewController.swift
//  TestSplitView
//
//  Created by mbujok on 30.01.2018.
//  Copyright © 2018 xtm. All rights reserved.
//

import UIKit
import SwiftMessages

class DetailsViewController: UIViewController {


    @IBOutlet weak var someView: UIView!
    @IBOutlet weak var smallButton: UIButton!

    @IBOutlet weak var wideButton: UIButton!

    let tabItem: Int = 3

    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.shared.statusBarStyle = .lightContent
        createShadow()

        // Do any additional setup after loading the view.
    }

    func createShadow() {
        let shadowPath = UIBezierPath()
        shadowPath.move(to: CGPoint(x: someView.frame.size.width, y: someView.bounds.origin.y))
        shadowPath.addLine(to: CGPoint(x: someView.bounds.width + 7.0, y: someView.bounds.height / 2))
        shadowPath.addLine(to: CGPoint(x: someView.bounds.width, y: someView.bounds.height))

        shadowPath.close()

        someView.layer.shadowColor = UIColor.darkGray.cgColor
        someView.layer.shadowOpacity = 1
        someView.layer.masksToBounds = false
        someView.layer.shadowPath = shadowPath.cgPath
        someView.layer.shadowRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onToggle(_ sender: Any) {
        DispatchQueue.main.async {
            if self.splitViewController?.preferredDisplayMode == .primaryHidden {
                UIView.animate(withDuration: 0.33, animations: {
                    self.splitViewController?.preferredDisplayMode = .allVisible
                })
            } else if self.splitViewController?.preferredDisplayMode == .allVisible {
                UIView.animate(withDuration: 0.33, animations: {
                    self.splitViewController?.preferredDisplayMode = .primaryHidden
                })
            } else {
                let bb: UISplitViewControllerDisplayMode
                if let sc = self.splitViewController {
                    bb = sc.preferredDisplayMode
                }
                print(self.splitViewController?.preferredDisplayMode ?? "other mode")

                UIView.animate(withDuration: 0.33, animations: {
                    self.splitViewController?.preferredDisplayMode = .primaryHidden
                })
            }

            self.createShadow()
        }

        if let tabItems = self.tabBarController?.tabBar.items as NSArray!
        {
            for item in tabItems {
                if let ti = item as? UITabBarItem {
                    ti.badgeValue = nil
                    ti.badgeColor = nil 
                }
            }
        }
    }

    @IBAction func onSmall(_ sender: Any) {

        let view = MessageView.viewFromNib(layout: .statusLine)

        view.configureTheme(.warning)
        view.configureContent(body: "App in offline mode")
        view.button?.isHidden = true

        var config = SwiftMessages.Config()

        // Slide up from the bottom.
        config.presentationStyle = .top

        // Display in a window at the specified window level: UIWindowLevelStatusBar
        // displays over the status bar while UIWindowLevelNormal displays under.
        config.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)

        // Disable the default auto-hiding behavior.
        config.duration = .automatic

        // Dim the background like a popover view. Hide when the background is tapped.
        //        config.dimMode = .gray(interactive: true)

        // Disable the interactive pan-to-hide gesture.
        config.interactiveHide = false

        // Specify a status bar style to if the message is displayed directly under the status bar.
        config.preferredStatusBarStyle = .lightContent

        // Specify one or more event listeners to respond to show and hide events.
        config.eventListeners.append() { event in
            if case .didHide = event { print("yep") }
        }

        SwiftMessages.show(config: config, view: view)

        if let tabItems = self.tabBarController?.tabBar.items as NSArray!
        {
            // In this case we want to modify the badge number of the third tab:
            let tabItem = tabItems[self.tabItem] as! UITabBarItem
//            tabItem.badgeColor = .red
            tabItem.badgeValue = "!"
        }
    }

    @IBAction func onWide(_ sender: Any) {

        let view = MessageView.viewFromNib(layout: .statusLine)

        view.configureTheme(.warning)
        view.configureContent(body: "App in offline mode")

        SwiftMessages.show(view: view)

        if let tabItems = self.tabBarController?.tabBar.items as NSArray!
        {
            // In this case we want to modify the badge number of the third tab:
            let tabItem = tabItems[self.tabItem] as! UITabBarItem
            tabItem.badgeColor = UIColor(red: 241 / 255, green: 186 / 255, blue: 16 / 255, alpha: 1)
            tabItem.badgeValue = "!"
        }
    }

    @IBAction func onOverlay(_ sender: Any) {

        let view = MessageView.viewFromNib(layout: .messageView)

        view.configureTheme(.warning)
        view.configureContent(title: "App in offline mode", body: "Last sync on 1.03.2018 at 10:20")
        view.button?.setTitle("Close", for: .normal)

        var config = SwiftMessages.Config()

        // Slide up from the bottom.
        config.presentationStyle = .bottom

        // Display in a window at the specified window level: UIWindowLevelStatusBar
        // displays over the status bar while UIWindowLevelNormal displays under.
        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)

        // Disable the default auto-hiding behavior.
        config.duration = .automatic

        // Dim the background like a popover view. Hide when the background is tapped.
        //        config.dimMode = .gray(interactive: true)

        // Disable the interactive pan-to-hide gesture.
        config.interactiveHide = false

        // Specify a status bar style to if the message is displayed directly under the status bar.
        config.preferredStatusBarStyle = .lightContent

        // Specify one or more event listeners to respond to show and hide events.
        config.eventListeners.append() { event in
            if case .didHide = event { print("yep") }
        }

        SwiftMessages.show(config: config, view: view)

        if let tabItems = self.tabBarController?.tabBar.items as NSArray!
        {
            // In this case we want to modify the badge number of the third tab:
            let tabItem = tabItems[self.tabItem] as! UITabBarItem
            tabItem.badgeColor = .lightGray
            tabItem.badgeValue = "😱"
        }
    }

    @IBAction func onPageSheetButton(_ sender: Any) {

        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FormSheet") as! FormSheetViewController

        view.modalPresentationStyle = UIModalPresentationStyle.pageSheet

        self.present(view, animated: true, completion: nil)
    }

    @IBAction func onFormSheetButton(_ sender: Any) {

        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FormSheet") as! FormSheetViewController

        view.modalPresentationStyle = UIModalPresentationStyle.formSheet

        self.present(view, animated: true, completion: nil)
    }

    @IBAction func onPopoverButton(_ sender: Any) {

        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FormSheet") as! FormSheetViewController

        view.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext

        self.present(view, animated: true, completion: nil)
    }

}
