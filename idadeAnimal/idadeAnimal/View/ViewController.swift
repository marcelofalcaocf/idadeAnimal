//
//  ViewController.swift
//  idadeAnimal
//
//  Created by Marcelo Falcao Costa Filho on 22/11/22.
//

import UIKit

enum AnimalSize: String, CaseIterable {
    case pequeno = "Pequeno"
    case medio = "Médio"
    case grande = "Grande"
}

class ViewController: UIViewController {
    
    lazy var viewScreen: ViewControllerScreen = .init()

    var animalChosen: String?
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScreen.delegateTableView(delegate: self, dataSource: self)
        viewScreen.delegateTextField(delegate: self)
    }
        
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        animalChosen = AnimalSize.allCases[indexPath.row].rawValue
        
        if viewScreen.validateTextFields() {
            guard let animalChosen = animalChosen else { return }
            viewScreen.ageAnimalInHuman(string: animalChosen)
        } else {
            viewScreen.noticeToUser()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AnimalSize.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AnimalTableViewCell.identifier, for: indexPath) as? AnimalTableViewCell {
            cell.setUpCell(data: AnimalSize.allCases[indexPath.row].rawValue)
            return cell
        }
        return UITableViewCell()
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        viewScreen.reloadTableViewTextField()
        return true
    }
}
