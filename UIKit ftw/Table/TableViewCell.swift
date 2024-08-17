//
//  TableViewCell.swift
//  UIKit ftw
//
//  Created by Marius Preikschat on 13.08.24.
//

import UIKit

class TableViewCell: UITableViewCell {
        
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .natural
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let badge: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.layer.backgroundColor = UIColor.orange.cgColor
        return label
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(badge)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            badge.leadingAnchor.constraint(lessThanOrEqualTo: titleLabel.trailingAnchor, constant: 12),
            badge.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            badge.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

#Preview {
    let cell = TableViewCell()
    cell.titleLabel.text = "title"
    cell.badge.text = "9+"
    return cell
}
