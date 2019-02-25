//
//  AppDelegate.swift
//  iReport Gimpa
//
//  Created by Kwesi Cobbina on 30/04/2017.
//  Copyright © 2017 Kwesi Cobbina. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate{

    var window: UIWindow?

    var email: String?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FIRApp.configure()
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        let mainView = LoginController()
        //window?.rootViewController = UINavigationController(rootViewController: HomeController())
        window?.rootViewController = mainView
        window?.backgroundColor = UIColor.white
        return true
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        guard let idToken = user.authentication.idToken else {return}
        guard let accessToken = user.authentication.accessToken else {
            return
        }
        email = user.profile.email
        
        if (email?.contains("st.gimpa.edu.gh"))!{
//            let aiv = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
//            aiv.center = (window?.rootViewController?.view?.center)!
//            aiv.color = UIColor.purple
//            window?.rootViewController?.view?.addSubview(aiv)
//            aiv.startAnimating()
            LoaderController.sharedInstance.showLoader()

        let credentials = FIRGoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        FIRAuth.auth()?.signIn(with: credentials, completion: { (user, error) in
            if let err = error{
                print("Failed:", err)
                return
            }
            
            
            guard let uid = user?.uid else{return}
//            aiv.stopAnimating()
            LoaderController.sharedInstance.removeLoader()
            let IVC = SelectorController()
            self.window?.rootViewController = IVC
            self.window?.makeKeyAndVisible()
            print("Successful", uid)
            
        })
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Sorry for that.. Please use your student email.Thank you.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default
                , handler: nil))
            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
            GIDSignIn.sharedInstance().signOut()
            print("failed")
        }
    }
    
    
    
    
    func application(_ app: UIApplication, open url: URL, options:[UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let handler = GIDSignIn.sharedInstance().handle(url,
                                            sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        return handler
    }
    


    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

