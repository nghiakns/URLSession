//
//  HeroViewController.swift
//  URLSession
//
//  Created by Kim Nghĩa on 08/09/2022.
//

import UIKit

class HeroViewController: UIViewController {

    @IBOutlet weak var heroImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var attributeLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var legsLbl: UILabel!
    
    var newlist: List?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = "\(String(describing: newlist?.albumId))"
        attackLbl.text = "\(String(describing: newlist?.id))"
        attributeLbl.text = newlist?.title
        legsLbl.text = newlist?.url
        
        let urlImage = newlist!.url
        heroImg.downloaded(from: urlImage)
    }

}
