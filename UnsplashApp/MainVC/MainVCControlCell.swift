//
//  MainVCControlCell.swift
//  UnsplashApp
//
//  Created by Mykhailo Romanovskyi on 15.08.2020.
//  Copyright © 2020 Mykhailo Romanovskyi. All rights reserved.
//
protocol SegmentedControllProtocol: class {
    func actionSV(index: Int)
    func buttonAction(cell: MainVCControlCell, tag: Int)
}

import UIKit

class MainVCControlCell: UICollectionViewCell {
    let buttonFirst = UIButton()
    let buttonSecond = UIButton()
    
     static let reuseId = "mainControlCell"
    
    weak var delegat: SegmentedControllProtocol?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        let attributesGray: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor(red: 162/255, green: 161/255, blue: 161/255, alpha: 1),
        .font: UIFont(name: "HelveticaNeue-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .medium)
        ]
        
        let attributesBlack: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black
        ]
        
        let nameSegment = UISegmentedControl(items: ["Popula", "New", "Follow"])
        let styleSegment = UISegmentedControl(items: [UIImage(systemName: "rectangle.grid.1x2")!,
                                                      UIImage(systemName: "rectangle.grid.2x2")!
        ])
        
        nameSegment.selectedSegmentTintColor = .clear
        nameSegment.setTitleTextAttributes(attributesGray, for: .normal)
        nameSegment.setTitleTextAttributes(attributesBlack, for: .selected)
        nameSegment.selectedSegmentIndex = 0
        nameSegment.backgroundColor = .white
        nameSegment.selectedSegmentTintColor = .white
        nameSegment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        nameSegment.addTarget(self, action: #selector(actionStyleSegmented(_:)), for: .valueChanged)
        
        styleSegment.tintColor = .brown
        styleSegment.backgroundColor = .none
       
        buttonFirst.setImage(UIImage(systemName: "rectangle.grid.1x2"), for: .normal)
        buttonFirst.tintColor = UIColor(red: 162/255, green: 161/255, blue: 161/255, alpha: 1)
        buttonFirst.tag = 0
        buttonFirst.addTarget(self,action: #selector(buttonPressed), for: .touchUpInside)
        
        buttonSecond.setImage(UIImage(systemName: "rectangle.grid.2x2"), for: .normal)
        buttonSecond.tintColor = UIColor(red: 162/255, green: 161/255, blue: 161/255, alpha: 1)
        buttonSecond.tag = 1
        buttonSecond.addTarget(self,action: #selector(buttonPressed), for: .touchUpInside)
        
        let secondStack = UIStackView(arrangedSubviews: [buttonFirst, buttonSecond])
        secondStack.axis = .horizontal
        
        let stack = UIStackView(arrangedSubviews: [nameSegment, secondStack])
        stack.axis = .horizontal
 //       stack.spacing = 116

        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: contentView.topAnchor),
         //   stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func actionStyleSegmented(_ sender: UISegmentedControl) {
        let a = sender.selectedSegmentIndex
        delegat?.actionSV(index: a)
    }
    
    @objc private func buttonPressed(_ sender:UIButton) {
        delegat?.buttonAction(cell: self, tag: sender.tag)
    }
    
}