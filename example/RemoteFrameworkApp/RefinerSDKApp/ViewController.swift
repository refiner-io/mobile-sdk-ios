//
//  ViewController.swift
//  RefinerSDKApp
//
//  Created by Anıl Taşkıran on 23.03.2022.
//

import UIKit
import RefinerSDK

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Refiner.instance.attachToResponse(
            data: [
                "some_data": "hello",
                "some_more_data": "hello again"
            ])
        
        Refiner.instance.trackScreen(name: "Homepage")
        
        do {
            try Refiner.instance.identifyUser(
                userTraits: [
                    "email": "hello@hello.com"
                ],
                userId: "USER_ID")
        } catch {
            print(error.localizedDescription)
        }

        Refiner.instance.showForm(uuid: "616fc500-5d32-11ea-8fd5-f140dbcb9780", force: true)
        Refiner.instance.trackEvent(name: "ViewDidLoad")
    }
    
    @IBAction func showRefinerSurvey() {
        Refiner.instance.showForm(uuid: "616fc500-5d32-11ea-8fd5-f140dbcb9780", force: false)
    }
}

