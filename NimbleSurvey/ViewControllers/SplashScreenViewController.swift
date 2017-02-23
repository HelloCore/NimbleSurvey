//
//  SplashScreenViewController.swift
//  NimbleSurvey
//
//  Created by AKKHARAWAT CHAYAPIWAT on 2/23/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import UIKit
import SVProgressHUD
import Moya
import Moya_ObjectMapper

class SplashScreenViewController: UIViewController {
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		SVProgressHUD.show()
		
		let provider = MoyaProvider<NimbleService>(stubClosure: MoyaProvider.delayedStub(0.2))
		provider.request(.fetchSurveys) { (response) in
			SVProgressHUD.dismiss()
			switch response {
			case .success(let response):
				let surveys = try? response.mapArray(Survey.self)
				if let surveys = surveys {
					self.performSegue(withIdentifier: Constants.SegueIdentifier.GoToMainPage, sender: surveys)
				}else{
					print("ERROR")
				}
				break
			case .failure(let error):
				print(error)
				break
			}
		}
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
		
    }
    
	
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if(segue.identifier == Constants.SegueIdentifier.GoToMainPage){
			let navDestination = segue.destination as? UINavigationController
			
			if let navDestination = navDestination
				,let vc = navDestination.viewControllers.first as? ViewController
				,let surveys = sender as? [Survey] {
				vc.surveys = surveys
			}
		}
    }
	

}
