//
//  RegisterController.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 07.12.24.
//

import UIKit
import Lottie

class RegisterController: UIViewController {
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var animationView: LottieAnimationView!
    
    var callBack: ((String, String) -> Void)?
    
    let registerViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Registration"
        registerViewModel.readData()
        configureAnimationView()
    }
    
    func configureAnimationView() {
        animationView.play()
        animationView.loopMode = .playOnce
        animationView.animationSpeed = 0.5
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        guard let fullname = fullnameTextField.text, !fullname.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty
        else {
            let alert = UIAlertController(title: "Error", message: "Wrong input!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
            return
        }
        let user: User = .init(fullname: fullname, email: email, password: password, phone: phoneNumber)
        registerViewModel.register(user: user)
        callBack?(email, password)
        navigationController?.popViewController(animated: true)
    }
    
}
