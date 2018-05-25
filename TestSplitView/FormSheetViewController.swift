//
//  formSheetViewController.swift
//  TestSplitView
//
//  Created by mbujok on 13.03.2018.
//  Copyright © 2018 xtm. All rights reserved.
//

import UIKit

class FormSheetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
    }

    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onPopup(_ sender: Any) {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FormSheet") as! FormSheetViewController

        view.modalPresentationStyle = UIModalPresentationStyle.formSheet

        self.present(view, animated: true, completion: nil)
    }

    @IBAction func onNewFileTapped(_ sender: AnyObject) {

        //        self.analyticsTrackEvent(category: MAAnalyticsCategoryEnum.PROJECT.rawValue, action: MAAnalyticsActionEnum.BUTTON_CLICK.rawValue, label: "Add file", value: nil)

        let documentPicker: UIDocumentPickerViewController = UIDocumentPickerViewController(documentTypes: ["public.data", "public.content"], in: UIDocumentPickerMode.import)
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = UIModalPresentationStyle.formSheet

        self.present(documentPicker, animated: true, completion: nil)
    }
}

extension FormSheetViewController: UIDocumentPickerDelegate {

    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {

        if controller.documentPickerMode == UIDocumentPickerMode.import {
            
        }
    }
}
