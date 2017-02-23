//
//  SurveyTheme.swift
//  NimbleSurvey
//
//  Created by AKKHARAWAT CHAYAPIWAT on 2/23/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import Foundation
import ObjectMapper

class SurveyTheme: Mappable {
	
	var color_active: String?
	var color_inactive: String?
	var color_question: String?
	var color_answer_normal: String?
	var color_answer_inactive: String?
	
	required init?(map: Map){
		
	}
	
	func mapping(map: Map) {
		color_active <- map[""]
		color_inactive <- map["color_inactive"]
		color_question <- map["color_question"]
		color_answer_normal <- map["color_answer_normal"]
		color_answer_inactive <- map["color_answer_inactive"]
	}
}
