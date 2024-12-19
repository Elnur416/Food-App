//
//  RegisterController.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 07.12.24.
//

import UIKit
import Lottie

class RegisterController: UIViewController {
    @IBOutlet private weak var fullnameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var phoneNumberTextField: UITextField!
    @IBOutlet private weak var animationView: LottieAnimationView!
    
    var callBack: ((String, String) -> Void)?
    
    let viewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Registration"
        viewModel.readData()
        configureAnimationView()
        configureViewModel()
    }
    
    func configureViewModel() {
        viewModel.error = {
            let alert = UIAlertController(title: "Error", message: "Account already exists!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
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
        viewModel.register(user: user)
        callBack?(email, password)
        navigationController?.popViewController(animated: true)
    }
    
}
