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

		mainCollectionView.emptyDataSetSource = self
		mainPageControl.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
		
//		fetchSurveyData()
	}
	

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}
	
	@IBAction func refreshBtnTap(_ sender: Any) {
		fetchSurveyData()
	}
	
	func fetchSurveyData() {
		SVProgressHUD.show()
		let provider = MoyaProvider<NimbleService>(stubClosure: MoyaProvider.delayedStub(0.2))
		provider.request(.fetchSurveys) { (response) in
			SVProgressHUD.dismiss()
			if(self.surveys.count > 0){
				self.surveys.removeAll()
			}
			switch response {
			case .success(let response):
				let surveys = try? response.mapArray(Survey.self)
				if let surveys = surveys {
					self.surveys = surveys
				}
				
				break
			case .failure(_):
				
				break
			}
		}
	}
	
	func takeSurveyBtnTap() {
		performSegue(withIdentifier: Constants.SegueIdentifier.ShowDetailPage, sender: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == Constants.SegueIdentifier.ShowDetailPage {
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

