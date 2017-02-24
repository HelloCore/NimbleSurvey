//
//  Constants.swift
//  NimbleSurvey
//
//  Created by AKKHARAWAT CHAYAPIWAT on 2/23/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import Foundation

struct Constants {
	struct SegueIdentifiers {
		static let ShowDetailPage = "SHOW_DETAIL_PAGE"
	}
	
	struct UserDetaultKeys {
		static let accessTokenKey = "USER_DEFAULT_ACCESS_TOKEN_KEY"
	}
	
	struct ParametersKey {
		struct FetchSurveys {
			static let accessTokenKey = "access_token"
		}
		
		struct Authen {
			static let grantTypeKey = "grant_type"
			static let grantTypeValue = "password"
			
			static let usernameKey = "username"
			static let passwordKey = "password"
		}
	}
}
