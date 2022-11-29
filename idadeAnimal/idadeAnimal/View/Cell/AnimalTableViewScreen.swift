//
//  AnimalTableViewScreen.swift
//  idadeAnimal
//
//  Created by Marcelo Falcao Costa Filho on 22/11/22.
//

import UIKit

class AnimalTableViewScreen: UIView {

    lazy var sizeAnimalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSuperView()
        configLayout()
    }
    
    func configSuperView() {
        addSubview(sizeAnimalLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configLayout() {
        NSLayoutConstraint.activate([
            sizeAnimalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            sizeAnimalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            sizeAnimalLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            sizeAnimalLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

}
