//
//  LoginViewController.swift
//  ixLoc
//
//  Created by Miki von Ketelhodt on 2017/07/11.
//  Copyright © 2017 RBG Applications. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import Firebase

class LoginViewController: UIViewController, LoginButtonDelegate {

    @IBOutlet weak var loginContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        if let accessToken = AccessToken.current {
            // User is logged in, use 'accessToken' here.
            self.performSegue(withIdentifier: "navToMain", sender: nil)
        }
        */

        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
        //loginButton.center = loginContainerView.center
        loginButton.delegate = self
        
        loginContainerView.addSubview(loginButton)
    }

    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        
        let credential = FacebookAuthProvider.credential(withAccessToken: (AccessToken.current?.authenticationToken)!)
        
        Auth.auth().signIn(with: credential, completion: {(user, error) in
            if let error = error {
                // ...
                return
            }
            
            if let currentUser = Auth.auth().currentUser {
                print(currentUser.uid)
                print(currentUser.displayName)
                print(currentUser.photoURL)
            }
            
            // Navigate to the main view controller
            self.performSegue(withIdentifier: "navToMain", sender: nil)
        })
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        
    }
    
}
