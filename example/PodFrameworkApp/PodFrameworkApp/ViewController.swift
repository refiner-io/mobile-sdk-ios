//
//  ViewController.swift
//  RefinerSDKApp
//
//  Created by Anıl Taşkıran on 23.03.2022.
//

import UIKit
import RefinerSDK

class ViewController: UIViewController {
    let FORM_ID = "11e205d0-d781-11eb-88f1-71a2a32fb76a"
    let SECOND_FORM_ID = "f1cd5620-60e2-11ea-933e-c12a4e219567"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Refiner.instance.attachToResponse(
            data: [
                "some_data": "hello",
                "some_more_data": "hello again"
            ])
        
        do {
            try Refiner.instance.identifyUser(userId: "my-user-id",
                                              userTraits: [
                                                "email": "hello@mail.com.tr"
                                              ],
                                              locale: "en-EN")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func trackScreen() {
        Refiner.instance.trackScreen(name: "Homepage")
    }
    
    @IBAction func trackEvent() {
        Refiner.instance.trackEvent(name: "ViewDidLoad")
    }

    @IBAction func showRefinerSurvey() {
        Refiner.instance.showForm(uuid: SECOND_FORM_ID, force: true)
    }
}

