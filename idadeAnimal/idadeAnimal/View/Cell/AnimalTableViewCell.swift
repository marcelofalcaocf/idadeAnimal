//
//  AnimalTableViewCell.swift
//  idadeAnimal
//
//  Created by Marcelo Falcao Costa Filho on 22/11/22.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    static let identifier: String = "AnimalTableViewCell"
    
    lazy var animalTableViewView: AnimalTableViewScreen = {
        let view = AnimalTableViewScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configBackGround()
        configSuperView()
        configConstraints()
    }
    
    func configBackGround() {
        backgroundColor = .clear
    }
    
    func configSuperView() {
        animalTableViewView.layer.cornerRadius = 6.0
        contentView.addSubview(animalTableViewView)
    }
    
    public func setUpCell(data: String) {
        animalTableViewView.sizeAnimalLabel.text = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            animalTableViewView.topAnchor.constraint(equalTo: topAnchor),
            animalTableViewView.leadingAnchor.constraint(equalTo: leadingAnchor),
            animalTableViewView.trailingAnchor.constraint(equalTo: trailingAnchor),
            animalTableViewView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
