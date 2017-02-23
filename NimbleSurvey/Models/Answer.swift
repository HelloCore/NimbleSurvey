//
//  Answer.swift
//  NimbleSurvey
//
//  Created by AKKHARAWAT CHAYAPIWAT on 2/23/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import Foundation
import ObjectMapper

class Answer: Mappable {
	
	var id: String = ""
	var question_id: String = ""
	var text: String = ""
	var help_text: String?
	var input_mask_placeholder: String?
	var short_text: String = ""
	var is_mandatory: Bool = false
	var is_customer_first_name: Bool = false
	var is_customer_last_name: Bool = false
	var is_customer_title: Bool = false
	var is_customer_email: Bool = false
	var prompt_custom_answer: Bool = false
	var weight: String?
	var display_order: Int = 0
	var display_type: String?
	var input_mask: String?
	var date_constraint: String?
	var default_value: String?
	var response_class: String = ""
	var reference_identifier: String?
	var score: Int = 0
	var alerts: [String]?
	
	
	required init?(map: Map){
		
	}
	
	func mapping(map: Map) {
		id <- map[" id "]
		question_id <- map[" question_id "]
		text <- map[" text "]
		help_text <- map[" help_text "]
		input_mask_placeholder <- map[" input_mask_placeholder "]
		short_text <- map[" short_text "]
		is_mandatory <- map[" is_mandatory "]
		is_customer_first_name <- map[" is_customer_first_name "]
		is_customer_last_name <- map[" is_customer_last_name "]
		is_customer_title <- map[" is_customer_title "]
		is_customer_email <- map[" is_customer_email "]
		prompt_custom_answer <- map[" prompt_custom_answer "]
		weight <- map[" weight "]
		display_order <- map[" display_order "]
		display_type <- map[" display_type "]
		input_mask <- map[" input_mask "]
		date_constraint <- map[" date_constraint "]
		default_value <- map[" default_value "]
		response_class <- map[" response_class "]
		reference_identifier <- map[" reference_identifier "]
		score <- map[" score "]
		alerts <- map[" alerts "]
	}
}
