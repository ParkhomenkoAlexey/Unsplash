//
//  ProfileCellTop.swift
//  UnsplashApp
//
//  Created by Mykhailo Romanovskyi on 16.08.2020.
//  Copyright © 2020 Mykhailo Romanovskyi. All rights reserved.
//

import UIKit

class ProfileCellTop: UICollectionViewCell {
    static let reuseId = "topProfileCell"
    
    private let avatarImageView = UIImageView()
    private let followButton = UIButton(type: .system)
    private let nameLabel = UILabel()
    private let titleLabel = UILabel()
    private let photoslabel = UILabel()
    private let likesLabel = UILabel()
    private let collectionsLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configurator()
        setupElements()
        setupConstraits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurator() {
        nameLabel.text = "Edward Nolan"
        titleLabel.text = "Photography lover from 8 years"
        photoslabel.text = "8 Pgotos"
        likesLabel.text = "176 Likes"
        collectionsLabel.text = "6 Collections"
    }
}

//MARK: Private func
extension ProfileCellTop {
    
    private func setupElements() {
        
        nameLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        titleLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        photoslabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        likesLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        collectionsLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        avatarImageView.backgroundColor = .brown
        titleLabel.textColor = UIColor(red: 177/255, green: 177/255, blue: 177/255, alpha: 1)
        likesLabel.textColor = UIColor(red: 206/255, green: 206/255, blue: 206/255, alpha: 1)
        collectionsLabel.textColor = UIColor(red: 206/255, green: 206/255, blue: 206/255, alpha: 1)
        followButton.tintColor = .white
        followButton.backgroundColor = UIColor(red: 45/255, green: 164/255, blue: 1, alpha: 1)
        
        followButton.setTitle("Follow", for: .normal)
        followButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        followButton.titleEdgeInsets = UIEdgeInsets(top: 5, left: 9, bottom: 5, right: 9)
        followButton.layer.cornerRadius = 5
        
    }
    
    private func setupConstraits() {
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        followButton.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomStack = UIStackView(arrangedSubviews: [photoslabel, likesLabel, collectionsLabel])
        bottomStack.axis = .horizontal
        bottomStack.spacing = 42
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(avatarImageView)
        addSubview(followButton)
        addSubview(nameLabel)
        addSubview(titleLabel)
        addSubview(bottomStack)
        
        NSLayoutConstraint.activate([
            avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 65),
            avatarImageView.widthAnchor.constraint(equalToConstant: 65)
        ])
        
        NSLayoutConstraint.activate([
            followButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            followButton.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 28),
            followButton.widthAnchor.constraint(equalToConstant: 81)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 18)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 19)
        ])
    }
}
