//
//  QuestionViewController.swift
//  NimbleSurvey
//
//  Created by AKKHARAWAT CHAYAPIWAT on 2/24/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel!
	
	var survey: Survey?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		if let survey = survey {
			title = survey.title
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
