//
//  ViewController.swift
//  ZaraTest
//
//  Created by JOEDELROSARIO on 28/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    //let rmClient = RMClient()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imgRM: UIImageView!
    
    
    var characters: Characters?
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.goToRMApi))
        
        self.imgRM.addGestureRecognizer(recognizer)
        self.imgRM.isUserInteractionEnabled = true
        
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.stopAnimating()
        
    }
    
    /*
    func callApi() {
        Task.init {
            do {
                let characters = try await self.rmClient.character().getAllCharacters()
                print(characters)
            } catch (let error) {
              print(error)
            }
        }
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "RickyAndMortySegue" {
            let controller = segue.destination as! RMCharactersViewController
            controller.characters = self.characters
        }
    }
    
    @IBAction func goToRMApi(_ sender: UIButton) {
        self.activityIndicator.startAnimating()
        self.getCharacters()
    }
    
    func getCharacters() {
        NetworkingProvider.shared.getCharacters() { characters in
        print("Personajes: \(characters)")
            self.characters = characters
            self.activityIndicator.stopAnimating()
            self.performSegue(withIdentifier: "RickyAndMortySegue", sender: self)
        } error: { error in
            print(error ?? "No error")
            self.activityIndicator.stopAnimating()
        }
    }
    
    func getCharacter(id: Int) {
        NetworkingProvider.shared.getCharacter(id: id) { character in
        print("Personajes: \(character)")
            self.character = character
        } error: { error in
            print(error ?? "No error")
        }
    }
    
}

