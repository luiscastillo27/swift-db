//
//  ViewController.swift
//  VisorDocumentos
//
//  Created by Jorge M. B. on 18/04/18.
//  Copyright © 2018 Jorge M. B. All rights reserved.
//

import UIKit
import QuickLook
class ViewController: UIViewController, QLPreviewControllerDataSource {
    
    let preview = QLPreviewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preview.dataSource = self
    }

    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let path = Bundle.main.path(forResource: "PROTOCOLOS", ofType: "key")
        let url = URL(fileURLWithPath: path!)
        return url as QLPreviewItem
    }

    @IBAction func abrir(_ sender: UIButton) {
        present(preview, animated: true, completion: nil)
    }
    
}

