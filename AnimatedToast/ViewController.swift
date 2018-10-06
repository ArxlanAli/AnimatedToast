//
//  ViewController.swift
//  AnimatedToast
//
//  Created by Arslan Ali on 6/10/18.
//  Copyright © 2018 Arslan Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        ToastView.shared.addToast(view: self.view, text: "Hello My First Toast")
    }


}

