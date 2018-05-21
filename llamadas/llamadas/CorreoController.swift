//
//  CorreoController.swift
//  llamadas
//
//  Created by admin on 21/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit
import MessageUI

class CorreoController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtAsnto: UITextField!
    @IBOutlet weak var txtSMS: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil )
    }
    
    @IBAction func sendEmail(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            let email = MFMailComposeViewController()
            email.mailComposeDelegate = self
            email.setToRecipients([txtEmail.text!])
            email.setSubject(txtAsnto.text!)
            email.setMessageBody(txtEmail.text!, isHTML: false)
            present(email, animated: true, completion: nil )
        }
    }
  
}
