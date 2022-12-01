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
    
    func name() -> String {
        switch self {
        case .pequeno: return "Pequeno"
        case .medio: return "Médio"
        case .grande: return "Grande"
        }
    }
    
    var degress: Double {
        switch self {
        case .pequeno: return 6.0
        case .medio: return 7.0
        case .grande: return 7.5
        }
    }
}

class ViewController: UIViewController {
    
    lazy var viewScreen: ViewControllerScreen = .init()
    
    //var animalChosen: String?
    var animalChosen: AnimalSize?
    
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewScreen.delegateTableView(delegate: self, dataSource: self)
        viewScreen.delegateTextField(delegate: self)
    }
    
    private func ageAnimalInHuman(animalSize: AnimalSize) {
        viewScreen.configAgeAndSize(animalSize: animalSize)
    }
    
    private func userError() {
        viewScreen.noticeToUser()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        animalChosen = AnimalSize.allCases[indexPath.row]
        
        if viewScreen.validateTextFields() {
            guard let animalChosen = animalChosen else { return }
            ageAnimalInHuman(animalSize: animalChosen)
        } else {
            userError()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AnimalSize.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AnimalTableViewCell.identifier, for: indexPath) as? AnimalTableViewCell {
            let size = AnimalSize.allCases[indexPath.row].name()
            cell.setUpCell(data: size)
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
