//
//  SurveyCollectionViewCell.swift
//  NimbleSurvey
//
//  Created by AKKHARAWAT CHAYAPIWAT on 2/24/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import UIKit

class SurveyCollectionViewCell: UICollectionViewCell {
    
	@IBOutlet weak var backgroundImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descLabel: UILabel!
	@IBOutlet weak var submitButton: UIButton!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		submitButton.layer.cornerRadius = 22
	}
	
}
