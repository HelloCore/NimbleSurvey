//
//  Question.swift
//  NimbleSurvey
//
//  Created by AKKHARAWAT CHAYAPIWAT on 2/23/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import Foundation
import ObjectMapper

class Question: Mappable {
	
	var id: String = ""
	var text: String = ""
	var help_text: String?
	var display_order: Int = 0
	var short_text: String = ""
	var pick: String = "none"
	var display_type: String?
	var is_mandatory: Bool = false
	var correct_answer_id: String?
	var facebook_profile: String?
	var twitter_profile: String?
	var image_url: String?
	var cover_image_url: String?
	var cover_image_opacity: Float = 1.0
	var cover_background_color: String?
	var is_shareable_on_facebook: Bool = false
	var is_shareable_on_twitter: Bool = false
	var font_face: String?
	var font_size: String?
	var tag_list: String = ""
	var answers: [Answer]?
	
	required init?(map: Map){
		
	}
	
	func mapping(map: Map) {
		id <- map["id"]
		text <- map["text"]
		help_text <- map["help_text"]
		display_order <- map["display_order"]
		short_text <- map["short_text"]
		pick <- map["pick"]
		display_type <- map["display_type"]
		is_mandatory <- map["is_mandatory"]
		correct_answer_id <- map["correct_answer_id"]
		facebook_profile <- map["facebook_profile"]
		twitter_profile <- map["twitter_profile"]
		image_url <- map["image_url"]
		cover_image_url <- map["cover_image_url"]
		cover_image_opacity <- map["cover_image_opacity"]
		cover_background_color <- map["cover_background_color"]
		is_shareable_on_facebook <- map["is_shareable_on_facebook"]
		is_shareable_on_twitter <- map["is_shareable_on_twitter"]
		font_face <- map["font_face"]
		font_size <- map["font_size"]
		tag_list <- map["tag_list"]
		answers <- map["answers"]
	}
}
