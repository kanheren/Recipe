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
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    // iOS device screen width.
    public var screenWidth: CGFloat { return UIScreen.main.bounds.width}
    // iOS device screen height.
    public var screenHeight: CGFloat { return UIScreen.main.bounds.height}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()
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

}
