//
//  ViewController.swift
//  Example UIKit
//
//  Created by Zetegy on 12/6/19.
//

import UIKit
import PZCircularControl
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let control = PZCircularControl(
            PZCircularControlParams(
                innerBackgroundColor: Color.black,
                outerBackgroundColor: Color.black,
                tintColor: LinearGradient(gradient: Gradient(colors: [.yellow, .pink]), startPoint: .bottomLeading, endPoint: .topLeading),
                textColor: .orange,
                barWidth: 24.0,
                glowDistance: 15.0,
                initialValue: CGFloat(Float.random(in: 0...1))
            )
        )
        
        let childView = UIHostingController(rootView: control)
        addChild(childView)
        childView.view.frame = self.view.frame
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
        
        control.params.progress = CGFloat(Float.random(in: 0...1))
        
    }

}

