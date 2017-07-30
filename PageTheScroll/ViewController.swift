//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Luke Fitzgerald on 6/27/17.
//  Copyright © 2017 Luke Fitzgerald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var images = [UIImageView]()
    @IBOutlet weak var scrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        let scrollWidth = scrollview.frame.size.width
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            
            // calculating the position of the images in each frame
            newX = scrollWidth  / 2 + scrollWidth * CGFloat(x)
            
            // this contentWidth tracks how wide the scrollview is going to be
            // by adding together however many frames there are
            contentWidth += newX
            
            // add image to scroll view
            scrollview.addSubview(imageView)
            
            // setting the frame on the image
            // position the image in the center
            imageView.frame = CGRect(x: newX - 75, y: (scrollview.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        
        scrollview.backgroundColor = UIColor.purple
        scrollview.clipsToBounds = false
        
        // Setting the width of the content to how ever many frames there are
        scrollview.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
    }

}

