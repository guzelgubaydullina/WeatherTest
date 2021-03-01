//
//  LoadingScreenController.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2021 Guzel Gubaidullina. All rights reserved.
//

import UIKit

class LoadingScreenController: UIViewController {
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadingIconAppearing()
    }
    
    func loadingIconAppearing() {
        UIView.animateKeyframes(withDuration: 2,
        delay: 0,
        options: .calculationModeCubic,
        animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0,
                               relativeDuration: 0.5,
                               animations: {
                                self.loadingImage.alpha = 1.0 })
            UIView.addKeyframe(withRelativeStartTime: 0.5,
                               relativeDuration: 0.5,
                               animations: {
                                self.loadingLabel.alpha = 1.0 })
            }, completion: { finished in
                self.performSegue(withIdentifier: "segueShowCitiesListContoller", sender: self)
            })
    }
}
