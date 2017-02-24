//
//  NimbleService.swift
//  NimbleSurvey
//
//  Created by AKKHARAWAT CHAYAPIWAT on 2/23/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import Foundation
import Moya

enum NimbleService {
	case fetchSurveys
	case authen(username: String, password: String)
}

extension NimbleService: TargetType {
	var baseURL: URL { return URL(string: "https://nimbl3-survey-api.herokuapp.com")! }
	var path: String {
		switch self {
		case .fetchSurveys:
			return "/surveys.json"
		case .authen(_, _):
			return "/oauth/token"
		}
	}
	var method: Moya.Method {
		switch self {
		case .fetchSurveys:
			return .get
		case .authen:
			return .post
		}
	}
	var parameters: [String: Any]? {
		switch self {
		case .fetchSurveys:
			let userDefault = UserDefaults.standard
			if let token = userDefault.string(forKey: Constants.UserDetaultKeys.accessTokenKey) {
				return [Constants.ParametersKey.FetchSurveys.accessTokenKey : token]
			}
			return nil
		case .authen(let username, let password):
			return [Constants.ParametersKey.Authen.grantTypeKey : Constants.ParametersKey.Authen.grantTypeValue,
			        Constants.ParametersKey.Authen.usernameKey : username,
			        Constants.ParametersKey.Authen.passwordKey : password]
		}
	}
	var parameterEncoding: ParameterEncoding {
		switch self {
		case .fetchSurveys, .authen:
			return URLEncoding.default
		}
	}
	
	
	var sampleData: Data {
		switch self {
		case .fetchSurveys:
			#if DEBUG
				if let path = Bundle.main.path(forResource: "surveys", ofType: "json")
					,let data = try? Data(contentsOf: URL(fileURLWithPath: path)){
					return data
				}
			#endif
			return Data()
		case .authen:
			return "d9584af77d8c0d6622e2b3c554ed520b2ae64ba0721e52daa12d6eaa5e5cdd93".utf8Encoded
		}
	}
	
	var task: Task {
		switch self {
		case .fetchSurveys, .authen:
			return .request
		}
	}
}

fileprivate extension String {
	var urlEscaped: String {
		return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
	}
	
	var utf8Encoded: Data {
		return self.data(using: .utf8)!
	}
}
