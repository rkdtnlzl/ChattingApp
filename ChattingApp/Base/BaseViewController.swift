//
//  BaseViewController.swift
//  ChattingApp
//
//  Created by 강석호 on 7/18/24.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHierarchy()
        configureView()
        configureConstraints()
        configureTarget()
    }
    
    func configureNavigation() { }
     
    func configureHierarchy() { }
    
    func configureView() { }
    
    func configureConstraints() { }
    
    func configureTarget() { }
}
