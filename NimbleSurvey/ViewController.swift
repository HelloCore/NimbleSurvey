//
//  ViewController.swift
//  NimbleSurvey
//
//  Created by AKKHARAWAT CHAYAPIWAT on 2/23/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var surveys: [Survey]?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if let surveys = surveys {
			print(surveys)			
		}
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

