//
//  LeerViewController.swift
//  LectorQR
//
//  Created by Jorge M. B. on 19/03/18.
//  Copyright © 2018 Jorge M. B. All rights reserved.
//

import UIKit
import AVFoundation
class LeerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate{

    
    @IBOutlet weak var videoPreview: UIView!
    var stringURL = String()
    let sesion = AVCaptureSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scanner()
    }
    
    func scanner(){
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return}
        
        guard let input = try? AVCaptureDeviceInput(device: device) else { return }
        
        let output = AVCaptureMetadataOutput()
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        sesion.addInput(input)
        sesion.addOutput(output)
        
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        let preview = AVCaptureVideoPreviewLayer(session: sesion)
        preview.videoGravity = AVLayerVideoGravity.resizeAspectFill
        preview.frame = videoPreview.bounds
        videoPreview.layer.addSublayer(preview)
        sesion.startRunning()
        
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        sesion.stopRunning()
        if metadataObjects.count > 0 {
            let machine = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            if machine.type == AVMetadataObject.ObjectType.qr {
                stringURL = machine.stringValue!
                performSegue(withIdentifier: "enviar", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviar" {
            let destino = segue.destination as! ResultadoViewController
            destino.resString = stringURL
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if sesion.isRunning == false{
            sesion.startRunning()
        }
    }
    
    
}














