//
//  ViewController.swift
//  NimbleSurvey
//
//  Created by AKKHARAWAT CHAYAPIWAT on 2/23/17.
//  Copyright © 2017 AKKHARAWAT CHAYAPIWAT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var mainCollectionView: UICollectionView!
	@IBOutlet weak var mainPageControl: UIPageControl!
	
	var currentPage: Int = 0 {
		didSet {
			mainPageControl.currentPage = currentPage
		}
	}
	
	static let surveyCellIdentifier = "SURVEY_CELL_IDENTIFIER"
	
	var surveys = [Survey]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		mainPageControl.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
		mainPageControl.numberOfPages = surveys.count
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}
}

extension ViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return surveys.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.surveyCellIdentifier, for: indexPath)
		
		return cell
	}
}

extension ViewController: UICollectionViewDelegate {
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let scrollY = scrollView.contentOffset.y
		let page = floor(scrollY / mainCollectionView.frame.size.height)
		currentPage = Int(page)
	}
}


