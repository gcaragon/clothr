//
//  TutorialCell.swift
//  clothr
//
//  Created by Gilbert Aragon on 11/26/17.
//  Copyright © 2017 cmps115. All rights reserved.
//

import UIKit

class TutorialCell: UITableViewCell {
    @IBOutlet weak var tutorialText: UITextView?
    
    @IBOutlet weak var tutorialScroll: UIScrollView!
    
    var item: SettingsViewModelItem? {
        didSet {
            guard let item = item as? SettingsViewModelTutorialItem else {
                return
            }
            tutorialScroll.contentSize.height = 1200
            
            tutorialText?.text = item.tutorial
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
