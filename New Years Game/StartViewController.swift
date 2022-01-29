//
//  StartViewController.swift
//  New Years Game
//
//  Created by Sebastian Christiansen on 29/01/2022.
//

import UIKit

class StartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var playersView: UIView!
    @IBOutlet weak var playersLabel: UILabel!
    
    var primaryColor = UIColor(red: 105 / 255.0, green: 219 / 255.0, blue: 204 / 255, alpha: 1.0)
    var secondaryColor = UIColor(red: 137 / 255.0, green: 210 / 255.0, blue: 224 / 255, alpha: 1.0)
    
    var players = [Player(name: "Amalie", emoji: "👩🏼‍🎨"),
        Player(name: "Laura", emoji: "👩‍👧‍👦"), Player(name: "Niklas", emoji: "👩🏼‍🚒"),
        Player(name: "Lærke", emoji: "💆🏼‍♀️"), Player(name: "Henrik", emoji: "👨🏼‍🍳"),
        Player(name: "Jonathan", emoji: "⛹🏼")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.backgroundView?.backgroundColor = secondaryColor
        startButton.backgroundColor = secondaryColor
        startButton.layer.cornerRadius = 5
        startButton.tintColor = .white
        startButton.backgroundColor = secondaryColor
        startButton.addShadow()
        playersView.addShadow()
        playersView.layer.cornerRadius = 5
        playersView.backgroundColor = secondaryColor
        playersLabel.text = "Spillere"
        playersLabel.backgroundColor = .clear
        view.backgroundColor = primaryColor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as! PlayerCell
        
        let player = players[indexPath.row]

        cell.nameLabel.text = player.name
        cell.emojiLabel.text = player.emoji
        cell.emojiLabel.backgroundColor = .clear
        cell.nameLabel.backgroundColor = .clear
        cell.backgroundColor = secondaryColor
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func startPressed(_ sender: Any) {
        performSegue(withIdentifier: "startGameSegue", sender: self)
    }
}
