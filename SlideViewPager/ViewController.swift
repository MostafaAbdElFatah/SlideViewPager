//
//  ViewController.swift
//  SlideViewPager
//
//  Created by Mostafa Abd ElFatah on 10/2/19.
//  Copyright © 2019 Mostafa Abd ElFatah. All rights reserved.
//

import UIKit
import FSPagerView

class ViewController: UIViewController {

    var images:[UIImage] = []
    
    @IBOutlet weak var pagerView: FSPagerView!{
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    @IBOutlet weak var pageControll: FSPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 0...6 {
            self.images.append(UIImage(named: "image\(index)")!)
        }
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        //pagerView.transformer = FSPagerViewTransformer(type: .zoomOut)
    }


}

extension ViewController: FSPagerViewDelegate, FSPagerViewDataSource{
    
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return images.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = self.images[index]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = "\(index)/\(self.images.count)"
        return cell
    }
    
   
    
    
}


