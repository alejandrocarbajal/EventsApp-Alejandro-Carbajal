//
//  DetailViewController.swift
//  EventsApp
//
//  Created by Alejandro Carbajal on 11/21/18.
//  Copyright © 2018 Alejandro Carbajal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var detailLocationLabel: UILabel!
    
    var myEventCell: EventCell?
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    func  setUI () {
        detailNameLabel.text = myEventCell?.nameLabel.text
        detailImageView.image = myEventCell?.eventImage.image
        detailLocationLabel.text = myEventCell?.locationLabel.text
    }
    
}
