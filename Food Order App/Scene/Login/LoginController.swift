//
//  LoginController.swift
//  Food Order App
//
//  Created by Elnur Mammadov on 07.12.24.
//

import UIKit
import Lottie

class LoginController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var animationView: LottieAnimationView!
    
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        configureAnimationView()
        configureViewModel()
    }
    
    func configureAnimationView() {
        animationView.play()
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
    }
    
    func configureViewModel() {
        loginViewModel.success = {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            let sceneDelegate = windowScene.delegate as! SceneDelegate
            sceneDelegate.homeRoot()
        }
        loginViewModel.error = {
            let alert = UIAlertController(title: "Error", message: "Wrong Email or password!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        if let email = emailTextField.text, !email.isEmpty,
           let password = passwordTextField.text, !password.isEmpty {
            loginViewModel.loginAction(email: email, password: password)
            loginViewModel.getUserIndex(email: email, password: password)
        }
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(RegisterController.self)") as! RegisterController
        controller.callBack = { email, password in
            self.emailTextField.text = email
            self.passwordTextField.text = password
        }
        navigationController?.show(controller, sender: nil)
    }
}
