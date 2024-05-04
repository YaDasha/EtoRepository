//
//  ViewController.swift
//  NewNew
//
//  Created by Дарья Ксензова on 27.04.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var backgroundImageView: UIImageView = {
        var backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "Lisa-1")
        backgroundImage.contentMode = .scaleAspectFill
        return backgroundImage
    }()
    
    let buttonChangeLisa: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .magenta
        button.setTitle("Смена Лисы", for: .normal)
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = label.font.withSize(32)
        return label
    }()
    
    let buttonChangeViewController: UIButton = {
        let buttonChangeViewController = UIButton()
        buttonChangeViewController.backgroundColor = .lightGray
        buttonChangeViewController.setTitle("buttonChangeController", for: .normal)
        return buttonChangeViewController
    }()
    
    var nameOfSecondDog: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        view.addSubview(backgroundImageView)
        view.addSubview(label)
        view.addSubview(buttonChangeLisa)
        view.addSubview(buttonChangeViewController)
                
        buttonChangeLisa.addAction(UIAction(handler: changeLisa(_:)), for: .touchUpInside)
        buttonChangeViewController.addAction(UIAction(handler: openBornPinkController(_:)), for: .touchUpInside)
        
        settingConstraint()
        addNameOfSecondDog()
    }
    
    func changeLisa(_: UIAction) {
        
        if backgroundImageView.image == UIImage(named: "Lisa-2") {
            backgroundImageView.image = UIImage(named: "Lisa-1")
        } else {
            backgroundImageView.image = UIImage(named: "Lisa-2")
            //        view.insertSubview(backgroundImageView, at: 0)
        }
        
        print("Pik Pik")
    }
    
    func openBornPinkController(_: UIAction) {
        let BornPinkController = BornPinkController()
        BornPinkController.modalPresentationStyle = .fullScreen
        present(BornPinkController, animated: true, completion: nil)
    }
    
    func settingConstraint() {
        
        buttonChangeLisa.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(80)
        }
        
        buttonChangeViewController.snp.makeConstraints { make in
            make.bottom.equalTo(buttonChangeLisa.snp.top).offset(-13)
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(80)
        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(220)
            make.height.equalTo(80)
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func addNameOfSecondDog() {
        guard let nameOfSecondDog = nameOfSecondDog else { return }
        let string: String = nameOfSecondDog
        label.text = string
    }
    
}
