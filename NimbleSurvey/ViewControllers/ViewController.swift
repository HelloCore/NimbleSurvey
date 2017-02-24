//
//  ViewController.swift
//  NimbleSurvey
//
//  Created by AKKHARAWAT CHAYAPIWAT on 2/23/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import UIKit
import AlamofireImage
import PageControls
import Moya
import Moya_ObjectMapper
import SVProgressHUD
import DZNEmptyDataSet

class ViewController: UIViewController {
	
	
	@IBOutlet var emptyDataView: UIView!
	
	@IBOutlet weak var mainCollectionView: UICollectionView!
	@IBOutlet weak var mainPageControl: FilledPageControl!
	
	static let surveyCellIdentifier = "SURVEY_CELL_IDENTIFIER"
	
	var isLoaded = false
	var surveys = [Survey]() {
		didSet {
			mainPageControl.pageCount = surveys.count
			mainCollectionView.reloadData()
		}
	}
	var currentPage : Int {
		get {
			return mainPageControl.currentPage
		}
	}
		
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "SURVEYS"
		
//		Force set access_token
		UserDefaults.standard.set("d9584af77d8c0d6622e2b3c554ed520b2ae64ba0721e52daa12d6eaa5e5cdd93", forKey: Constants.UserDetaultKeys.accessTokenKey)
		
		mainCollectionView.emptyDataSetSource = self
		mainCollectionView.emptyDataSetDelegate = self
		
		// rotate page control 90 degree
		mainPageControl.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
		
		SVProgressHUD.setDefaultMaskType(.gradient)
		
		fetchSurveyData()
	}
	

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}
	
	@IBAction func refreshBtnTap(_ sender: Any) {
		fetchSurveyData()
	}
	
	func fetchSurveyData() {
		SVProgressHUD.show()
		
//		Stub Data Here
//		let provider = MoyaProvider<NimbleService>(stubClosure: MoyaProvider.delayedStub(2))
		
		let provider = MoyaProvider<NimbleService>()
		
		provider.request(.fetchSurveys) { [unowned self] (response) in
			self.isLoaded = true
			SVProgressHUD.dismiss()
			switch response {
			case .success(let response):
				let surveys = try? response.mapArray(Survey.self)
				if let surveys = surveys {
					self.surveys = surveys
					return
				}
				break
			case .failure(_):
				break
			}
			self.surveys = [Survey]()
		}
	}
	
	func takeSurveyBtnTap() {
		performSegue(withIdentifier: Constants.SegueIdentifiers.ShowDetailPage, sender: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == Constants.SegueIdentifiers.ShowDetailPage {
			if let target = segue.destination as? QuestionViewController {
				target.survey = surveys[currentPage]
			}
		}
	}
}

extension ViewController: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return surveys.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.surveyCellIdentifier, for: indexPath)
		if let cell = cell as? SurveyCollectionViewCell {
			let surveyObject = surveys[indexPath.row]
			if surveyObject.large_cover_image_url.isEmpty == false {
				if let cover_url = URL(string: surveyObject.large_cover_image_url) {
					cell.backgroundImageView.af_setImage(withURL: cover_url)
				}
			}
			cell.titleLabel.text = surveyObject.title
			cell.descLabel.text = surveyObject.description
			cell.submitButton.addTarget(self, action: #selector(takeSurveyBtnTap), for: .touchUpInside)
		}
		return cell
	}
}

extension ViewController: UICollectionViewDelegate {
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let scrollY = scrollView.contentOffset.y
		let pageHeight = mainCollectionView.frame.size.height
		
		// Find Page
		let page = scrollY / pageHeight
		
		// Calculate Progress
		let progressInPage = scrollY - (page * pageHeight)
		let progress = CGFloat(page) + progressInPage
		
		mainPageControl.progress = progress
	}
	
}

extension ViewController: DZNEmptyDataSetSource {
	
	func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
		return NSAttributedString(string: "Sorry", attributes: [NSForegroundColorAttributeName: UIColor.white])
	}
	
	func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
		return NSAttributedString(string: "Data Not Found", attributes: [NSForegroundColorAttributeName: UIColor.white])
	}
	
}

extension ViewController: DZNEmptyDataSetDelegate {
	func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
		return self.isLoaded
	}
	
	func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView!) -> Bool {
		return false
	}
}

