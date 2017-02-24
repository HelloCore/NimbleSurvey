//
//  Survey.swift
//  NimbleSurvey
//
//  Created by AKKHARAWAT CHAYAPIWAT on 2/23/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import Foundation
import ObjectMapper

class Survey: Mappable{
	var id: String?
	var title: String = ""
	var description: String = ""
	var access_code_prompt: String?
	var thank_email_above_threshold: String?
	var thank_email_below_threshold: String?
	var footer_content: String?
	var is_active: Bool = false
	var cover_image_url: String = ""
	var cover_background_color: String?
	var type: String?
	var created_at: String?
	var active_at: String?
	var inactive_at: String?
	var survey_version: Int = 0
	var short_url: String = ""
	var language_list: [String] = [String]()
	var default_language: String = ""
	var tag_list: String?
	var is_access_code_required: Bool = false
	var is_access_code_valid_required: Bool = false
	var access_code_validation: String = ""
	var theme: SurveyTheme?
	var questions: [Question]?
	
	var large_cover_image_url: String {
		get {
			return (cover_image_url.isEmpty) ? "" : cover_image_url + "l"
		}
	}
	
	required init?(map: Map){
		
	}

	func mapping(map: Map) {
		id <- map["id"]
		title <- map["title"]
		description <- map["description"]
		access_code_prompt <- map["access_code_prompt"]
		thank_email_above_threshold <- map["thank_email_above_threshold"]
		thank_email_below_threshold <- map["thank_email_below_threshold"]
		footer_content <- map["footer_content"]
		is_active <- map["is_active"]
		cover_image_url <- map["cover_image_url"]
		
		cover_background_color <- map["cover_background_color"]
		type <- map["type"]
		created_at <- map["created_at"]
		active_at <- map["active_at"]
		inactive_at <- map["inactive_at"]
		survey_version <- map["survey_version"]
		short_url <- map["short_url"]
		language_list  <- map["language_list"]
		default_language <- map["default_language"]
		tag_list <- map["tag_list"]
		is_access_code_required <- map["is_access_code_required"]
		is_access_code_valid_required <- map["is_access_code_valid_required"]
		access_code_validation <- map["access_code_validation"]
		theme <- map["theme"]
		questions <- map["questions"]
	}
}
