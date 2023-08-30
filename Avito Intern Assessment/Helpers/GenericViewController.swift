//
//  GenericViewController.swift
//  Avito Intern Assessment
//
//  Created by Anton Kholodkov on 31.08.2023.
//

import UIKit

class GenericViewController<V: UIView, VM: AnyObject>: UIViewController {
    
    //MARK: - Properties
    public var rootView: V { return view as! V }
    
    private let viewModel: VM
    
    //MARK: - Setup & Lifecycle
    init(viewModel: VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func loadView() {
        self.view = V()
    }
}
