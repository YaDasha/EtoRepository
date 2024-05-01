//
//  CustomCell.swift
//  NewNew
//
//  Created by Дарья Ксензова on 29.04.2024.
//

import UIKit
import SnapKit

class CustomCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .systemPurple
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    let backgroundImageBP: UIImageView = {
        var backgroundImageBP = UIImageView()
        backgroundImageBP.image = UIImage(named: "Lisa-4")
        backgroundImageBP.contentMode = .scaleAspectFill
        backgroundImageBP.clipsToBounds = true
        return backgroundImageBP
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(backgroundImageBP)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        settingConstraint()
    }
    
    func settingConstraint() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(10)
            make.trailing.equalTo(10)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.bottom.equalTo(-10)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
        }
        
        backgroundImageBP.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: CustomCellModel) {
        backgroundImageBP.image = model.backgroundImageBP
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        contentView.backgroundColor = model.backgroundColor
    }
}

struct CustomCellModel {
    let backgroundImageBP: UIImage
    let book: String
    let title: String
    let subtitle: String
    let condition: String
    let backgroundColor: UIColor
}
