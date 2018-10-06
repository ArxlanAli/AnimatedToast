//
//  ToastView.swift
//  AnimatedToast
//
//  Created by Arslan Ali on 6/10/18.
//  Copyright © 2018 Arslan Ali. All rights reserved.
//

import UIKit

class ToastView:NSObject{
    
    static var shared = ToastView()
    var timer = Timer()
    
    
    
    let label:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    
    let toastView = UIView()
    func addToast(view:UIView,text:String){
        
        toastView.backgroundColor = UIColor(displayP3Red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        toastView.frame = CGRect(x: 50, y: view.frame.height - 100, width: view.frame.width - 50, height: 50)
        view.addSubview(self.toastView)
        
        self.label.text = text
        toastView.addSubview(self.label)
        self.label.leftAnchor.constraint(equalTo: toastView.leftAnchor).isActive = true
        self.label.rightAnchor.constraint(equalTo: toastView.rightAnchor).isActive = true
        self.label.centerYAnchor.constraint(equalTo: toastView.centerYAnchor).isActive = true
        
        
        toastView.frame.origin.x += view.frame.width + 100
        
        UIView.animate(withDuration: 1.9, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.toastView.frame.origin.x -= (view.frame.width + 125)
        }, completion: { (completd) in
            self.timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.removeToast), userInfo: nil, repeats: false)
        })
        
       
    }
    
    @objc func removeToast(){
        self.timer.invalidate()
        UIView.animate(withDuration: 0.6, animations: {
            self.toastView.alpha = 0
        }) { (_) in
            self.toastView.removeFromSuperview()
        }
    }
    
}
