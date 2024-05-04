//
//  viewController2.swift
//  NewNew
//
//  Created by Дарья Ксензова on 27.04.2024.
//

import UIKit
import SnapKit

class BornPinkController: UIViewController {
    
    var backgroundImage2: UIImageView = {
        var backgroundImage2 = UIImageView()
        backgroundImage2.image = UIImage(named: "Lisa-3")
        backgroundImage2.contentMode = .scaleAspectFill
        return backgroundImage2
    }()
    
    let blueButton: UIButton = {
        let blueButton = UIButton(type: .system)
        blueButton.backgroundColor = .blue
        blueButton.setTitle("blueButton", for: .normal)
        blueButton.setTitleColor(.systemPink, for: .normal)
        return blueButton
    }()
    
    let backButton: UIButton = {
        let backButton = UIButton()
        backButton.backgroundColor = .clear
        backButton.setTitle("BackButton", for: .normal)
        backButton.setTitleColor(.red, for: .normal)
        return backButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        view.addSubview(backgroundImage2)
        view.addSubview(blueButton)
        view.addSubview(backButton)
        blueButton.addAction(UIAction(handler: openCustomTableView(_:)), for: .touchUpInside)
        backButton.addAction(UIAction(handler: closeThisView(_:)), for: .touchUpInside)
        
        settingConstraint()
    }
    func openCustomTableView(_: UIAction) {
        let customTableViewController = CustomTableViewController()
        customTableViewController.modalPresentationStyle = .fullScreen
        present(customTableViewController, animated: true, completion: nil)
    }
    
    func closeThisView(_: UIAction) {
        dismiss(animated: true, completion: nil)
    }
    
    func settingConstraint() {
        
        backButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        blueButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(80)
        }
        
        backgroundImage2.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
