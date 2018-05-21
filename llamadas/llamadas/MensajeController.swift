//
//  MensajeController.swift
//  llamadas
//
//  Created by admin on 21/05/18.
//  Copyright © 2018 iwebsapp. All rights reserved.
//

import UIKit
import MessageUI

class MensajeController: UIViewController, MFMessageComposeViewControllerDelegate{
    
    @IBOutlet weak var txtNumber: UITextField!
    @IBOutlet weak var txtSMS: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        dismiss(animated: true, completion: nil )
    }
    
    @IBAction func sendSMS(_ sender: UIButton) {
        if MFMessageComposeViewController.canSendText() {
            let message = MFMessageComposeViewController()
            message.body = txtSMS.text
            message.recipients = [txtNumber.text!]
            message.messageComposeDelegate = self
            present(message, animated: true, completion: nil )
        } else {
            print("no se envio el mensaje")
        }
    }
    
}
