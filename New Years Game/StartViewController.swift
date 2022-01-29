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
    
    var primaryColor = UIColor(red: 105 / 255.0, green: 219 / 255.0, blue: 204 / 255, alpha: 1.0)
    var secondaryColor = UIColor(red: 137 / 255.0, green: 210 / 255.0, blue: 224 / 255, alpha: 1.0)
    
    var players = [Player(name: "Amalie", emoji: "👩🏼‍🎨"),
        Player(name: "Laura", emoji: "👩‍👧‍👦"), Player(name: "Niklas", emoji: "👩🏼‍🚒"),
        Player(name: "Lærke", emoji: "💆🏼‍♀️"), Player(name: "Henrik", emoji: "👨🏼‍🍳"),
        Player(name: "Jonathan", emoji: "⛹🏼")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationController?.isNavigationBarHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.backgroundView?.backgroundColor = secondaryColor
        startButton.backgroundColor = secondaryColor
        startButton.layer.cornerRadius = 5
        startButton.tintColor = .white
        startButton.backgroundColor = secondaryColor
        startButton.addShadow()
        view.backgroundColor = primaryColor
        tableView.largeContentTitle = "Spillere"
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel(frame: CGRect(x: 0, y: -20, width: tableView.frame.width, height: 50))
        label.text = "Spillere"
        label.font = UIFont.systemFont(ofSize: 40)
        label.textColor = .white
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! GameViewController
        destVC.players = players
    }
    
    @IBAction func startPressed(_ sender: Any) {
        performSegue(withIdentifier: "startGameSegue", sender: self)
    }
}
