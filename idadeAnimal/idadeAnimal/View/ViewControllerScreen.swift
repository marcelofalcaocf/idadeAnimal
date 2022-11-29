//
//  ViewControllerScreen.swift
//  idadeAnimal
//
//  Created by Marcelo Falcao Costa Filho on 22/11/22.
//

import UIKit

class ViewControllerScreen: UIView {

    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Escolha o porte do seu animal e descubra a idade humana dele!"
        return label
    }()
    
    lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = UIColor(red: 199/255, green: 185/255, blue: 110/255, alpha: 1.0)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        textField.placeholder = "Digite a idade do seu pet"
        textField.textColor = .darkGray
        return textField
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 10
        tableView.register(AnimalTableViewCell.self, forCellReuseIdentifier: AnimalTableViewCell.identifier)
        return tableView
    }()
    
    lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        //label.text = "O porte aqui"
        return label
    }()
    
    lazy var ageHumanLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        //label.text = "Idade humana"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configBackGroundColor()
        configSuperview()
        configConstraints()
    }
    
    private func configBackGroundColor() {
        backgroundColor = .darkGray
    }
    
    private func configSuperview() {
        addSubview(welcomeLabel)
        addSubview(ageTextField)
        addSubview(tableView)
        addSubview(sizeLabel)
        addSubview(ageHumanLabel)
    }
    
    func delegateTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    func delegateTextField(delegate: UITextFieldDelegate) {
        ageTextField.delegate = delegate
    }
    
    func ageAnimalInHuman(string: String) {
        guard let number = Double(ageTextField.text ?? "0.0") else { return }
        sizeLabel.text = string
        
        for animal in AnimalSize.allCases {
            if animal.rawValue == string && animal.rawValue == "Pequeno" {
                ageHumanLabel.text = String("\(6.0 * number) anos")
            } else if animal.rawValue == string && animal.rawValue == "Médio" {
                ageHumanLabel.text = String("\(7.0 * number) anos")
            } else if animal.rawValue == string && animal.rawValue == "Grande" {
                ageHumanLabel.text = String("\(7.5 * number) anos")
            }
        }
    }
    
    func noticeToUser() {
        ageHumanLabel.text = "Informe a idade do seu pet"
    }
    
    func reloadTableViewTextField() {
        tableView.reloadData()
    }
    
    public func validateTextFields() -> Bool {
        let number: Double = Double(ageTextField.text ?? "0" ) ?? 0
        
        if number != 0 {
            return true
        } else {
            return false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            welcomeLabel.topAnchor.constraint(equalTo: topAnchor, constant:120),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 45),
            
            ageTextField.topAnchor.constraint(equalTo: welcomeLabel.topAnchor, constant: 50),
            ageTextField.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor,constant: 20),
            ageTextField.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor, constant: -20),
            ageTextField.heightAnchor.constraint(equalToConstant: 45),
            
            tableView.topAnchor.constraint(equalTo: ageTextField.topAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: ageTextField.leadingAnchor,constant: 10),
            tableView.trailingAnchor.constraint(equalTo: ageTextField.trailingAnchor, constant: -10),
            tableView.heightAnchor.constraint(equalToConstant: 160),
            
            sizeLabel.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 250),
            sizeLabel.leadingAnchor.constraint(equalTo: tableView.leadingAnchor,constant: 20),
            sizeLabel.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: -20),
            sizeLabel.heightAnchor.constraint(equalToConstant: 45),
            
            ageHumanLabel.topAnchor.constraint(equalTo: sizeLabel.topAnchor, constant: 50),
            ageHumanLabel.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor,constant: 20),
            ageHumanLabel.trailingAnchor.constraint(equalTo: sizeLabel.trailingAnchor, constant: -20),
            ageHumanLabel.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
