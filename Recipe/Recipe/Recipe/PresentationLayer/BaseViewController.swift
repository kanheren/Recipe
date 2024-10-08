//
//  BaseViewController.swift
//  Recipe
//
//  Created by Nandkishore on 10/7/24.
//

import UIKit

protocol BaseViewController_Protocol {
    func showAlertWith(titleText: String, messageText:String)
}

class BaseViewController: UIViewController, BaseViewController_Protocol {
    var keyboardSize: CGRect?
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // iOS device screen width.
    public var screenWidth: CGFloat { return UIScreen.main.bounds.width}
    // iOS device screen height.
    public var screenHeight: CGFloat { return UIScreen.main.bounds.height}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), 
                                               name: UIResponder.keyboardWillShowNotification, object: view.window)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), 
                                               name: UIResponder.keyboardWillHideNotification, object: view.window)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: view.window)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: view.window)
    }
    func setUpNavigationBar() {
        navigationItem.hidesBackButton = true
    }
    func showAlertWith(titleText: String, messageText:String) {
        performUIUpdate {
            let alert = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel) {_ in })
            self.present(alert, animated: true)
        }
    }
    func setBackgroundImage_Gradient_Light(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        UIImage(named: "Gradient_Light")?.draw(in: view.bounds)

        if let image = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            self.view.backgroundColor = UIColor(patternImage: image)
        }else{
            UIGraphicsEndImageContext()
            debugPrint("Image not available")
         }
    }
    // MARK: - Keyboard Notifications
    @objc
    func keyboardWillShow(_ notification: Notification) {
        // get the size of the keyboard
        let userInfo = notification.userInfo!
        keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    }

    @objc
    func keyboardWillHide(_ notification: Notification) {
        // get the size of the keyboard
        let userInfo = notification.userInfo!
        keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    }

}
