//
//  EventCell.swift
//  EventsApp
//
//  Created by Alejandro Carbajal on 9/20/18.
//  Copyright © 2018 Alejandro Carbajal. All rights reserved.
//

import Foundation
import UIKit
import Parse
import ParseUI

class EventCell: PFTableViewCell{
    
    //Outlets from table view cell
    
    @IBOutlet weak var eventImage: PFImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
}
