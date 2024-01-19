//
//  ViewController.swift
//  OtplessDemoApplication
//
//  Created by Sparsh on 10/01/24.
//

import UIKit
import OtplessSDK

class ViewController: UIViewController, onResponseDelegate {
    func onResponse(response: OtplessSDK.OtplessResponse?) {
        if let responseData = response?.responseData?["data"] as? [String: Any],
           let mobileData = responseData["mobile"] as? [String: Any],
           let name = mobileData["name"] as? String,
           let number = mobileData["number"] as? String {
            nameLabel.text = "Name : \(name)"
            numberlabel.text = "Number : \(number)"
        } else {
            print("Error accessing mobile name and number in responseData")
        }

    }
    
    // Check whether whatsapp is installed or not
    func isWhatsappInstalled() -> Bool{
        return Otpless.sharedInstance.isWhatsappInstalled()
    }
    

    private var nameLabel: UILabel!
    private var numberlabel: UILabel!
    private var startOtplessButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Is whatsapp installed : \(isWhatsappInstalled())")

        setupUI()
        setupConstraints()
    }

    private func setupUI() {
        // Create and configure nameLabel
        nameLabel = UILabel()
        nameLabel.text = "Name : "
        view.addSubview(nameLabel)

        // Create and configure numberlabel
        numberlabel = UILabel()
        numberlabel.text = "Number : "
        view.addSubview(numberlabel)

        // Create and configure startOtplessButton
        startOtplessButton = UIButton()
        startOtplessButton.setTitle("Start OTP-less", for: .normal)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(startOtplessButtonTapped))
        startOtplessButton.addGestureRecognizer(tapGesture)
        view.addSubview(startOtplessButton)
        
        
    }
    
    @objc private func startOtplessButtonTapped() {
            // Handle tap action for startOtplessButton
        Otpless.sharedInstance.delegate = self
        var initialParams = [String:Any]()
        initialParams["cid"] = "ef0kpz5g" // Replace with your cid.
        var params =  [String:Any]()
        params["method"] = "get"
        params["params"] = initialParams
        Otpless.sharedInstance.showOtplessLoginPageWithParams(vc: self, params: params)
    }

    private func setupConstraints() {
        // Disable autoresizing mask translation into constraints
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        numberlabel.translatesAutoresizingMaskIntoConstraints = false
        startOtplessButton.translatesAutoresizingMaskIntoConstraints = false

        // Center nameLabel vertically in the middle of the screen
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50), // Adjust top spacing as needed
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Center numberlabel vertically below nameLabel
        NSLayoutConstraint.activate([
            numberlabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20), // Adjust vertical spacing as needed
            numberlabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        // Center startOtplessButton vertically below numberlabel
        NSLayoutConstraint.activate([
            startOtplessButton.topAnchor.constraint(equalTo: numberlabel.bottomAnchor, constant: 20), // Adjust vertical spacing as needed
            startOtplessButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

