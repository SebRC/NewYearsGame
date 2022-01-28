//
//  ViewController.swift
//  New Years Game
//
//  Created by Sebastian Christiansen on 31/12/2021.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var activePlayerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var wrongAnswerButton: UIButton!
    @IBOutlet weak var showAnswerButton: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var correctAnswerButton: UIButton!
    @IBOutlet weak var leaderboardView: UIView!
    @IBOutlet weak var firstPlaceNameLabel: UILabel!
    @IBOutlet weak var firstPlaceEmojiLabel: UILabel!
    @IBOutlet weak var firstPlacePointsLabel: UILabel!
    @IBOutlet weak var secondPlaceNameLabel: UILabel!
    @IBOutlet weak var secondPlaceEmojiLabel: UILabel!
    @IBOutlet weak var secondPlacePointsLabel: UILabel!
    @IBOutlet weak var thirdPlaceNameLabel: UILabel!
    @IBOutlet weak var thirdPlaceEmojiLabel: UILabel!
    @IBOutlet weak var thirdPlacePointsLabel: UILabel!
    @IBOutlet weak var firstPlaceStackView: UIStackView!
    @IBOutlet weak var secondPlaceStackView: UIStackView!
    @IBOutlet weak var thirdPlaceStackView: UIStackView!
    
    var players = [Player(name: "Seb", emoji: "👨🏼‍💻"), Player(name: "Amalie", emoji: "👩‍👧‍👦"),
        Player(name: "Laura", emoji: "👩‍👧‍👦"), Player(name: "Niklas", emoji: "👩🏼‍🚒"),
        Player(name: "Lærke", emoji: "💆🏼‍♀️"), Player(name: "Henrik", emoji: "👨🏼‍🍳"),
        Player(name: "Henriks søn", emoji: "⛹🏼")]
    var currentQuestion: Question?
    var currentPlayer: Player?
    
    var questions = [
        Question(description: "Hvad går den tredje leg i Squid Game ud på?", points: 2,  answer: "Tug of war/Tovtrækning"),
        Question(description: "Hvem er ældst?", points: 5,  answer: "Henrik"),
        Question(description: "Hvad er en Amager plade?", points: 2,  answer: "En tatovering lige over røven 🍑"),
        Question(description: "Hvad siger folk fra Amager når de sværger?", points: 2,  answer: "Amager halshug"),
        Question(description: "Hvad er det mærkeligste du nogensinde har drømt?", points: 2,  answer: "❓"),
        Question(description: "Hvem er sejest?", points: 2,  answer: "Amalie 😊"),
        Question(description: "Fortæl to sandheder og en løgn", points: 3,  answer: "❓"),
        Question(description: "Hvor langt nåede det danske fodboldslandshold til EM og hvem slog dem ud?", points: 2,  answer: "Semifinalerne. De blev slået ud af England."),
        Question(description: "Hvem blev den første private borger til at rejse ud i rummet i deres eget rumskib?", points: 2,  answer: "Richard Branson. Han gjorde det 9 dage før Jeff Bezos."),
        Question(description: "Hvad er det vildste du har gjort i dit liv?", points: 2,  answer: "❓"),
        Question(description: "Hvilket job forestillede du dig du skulle have da du var barn?", points: 1,  answer: "❓"),
        Question(description: "Hvis du kunne vælge en superkræft, hvad skulle det så være og hvorfor?", points: 2,  answer: "❓"),
        Question(description: "Hvor mange mål lukkede det danske fodboldslandshold ind i VM kvalifikationen?", points: 1,  answer: "3"),
        Question(description: "Hvad bliver det legendariske Arsenal hold fra 2003-2004 sæsonen kaldt?", points: 2,  answer: "The Invincibles 🏆"),
        Question(description: "Hvad er det dummeste du har gjort mens du var fuld?", points: 2,  answer: "🍻❓"),
        Question(description: "Hvad er den mest irriterende vane du har?", points: 5,  answer: "🤬❓"),
        Question(description: "Hvad er det dummeste du har gjort som barn?", points: 3,  answer: "👶🏼❓"),
        Question(description: "Hvad er det pinligste du har grædt over?", points: 1,  answer: "❓"),
        Question(description: "Hvilket dyr minder mest om din højre sidemand og hvorfor?", points: 2,  answer: "❓"),
        Question(description: "Hvad kommer efter 20?", points: 2,  answer: "Politi 🚓"),
        Question(description: "Hvad kommer efter 20?", points: 2,  answer: "21"),
        Question(description: "Hvor gammel er Beyonce?", points: 2,  answer: "40"),
        Question(description: "Bum leg", points: 3,  answer: "Bum"),
        Question(description: "Finish the lyrics:\nLil Nas X Send her back to her boyfriend with my handprint on her ...", points: 2,  answer: "ass cheek"),
        Question(description: "Finish the lyrics:\nEd Sheeran My bad habits lead to ...", points: 2,  answer: "late nights ending alone"),
        Question(description: "Finish the lyrics:\nPSY Oppan Ganganm Style ...", points: 2,  answer: "Ehhh sexy lady"),
        Question(description: "Finish the lyrics: In the jungle, the mighty jungle ...", points: 2,  answer: "the lion sleeps tonight"),
        Question(description: "Hvem blev kåret til den bedste kvindelige fodboldspiller i 2021?", points: 2,  answer: "Alexia Putellas ⚽️"),
        Question(description: "Hvilken placering fik det danske kvindehåndboldshold til VM?", points: 2,  answer: "Bronze"),
        Question(description: "Hvad er Bilkas slogan?", points: 2,  answer: "Hvem ka' Bilka"),
        Question(description: "Hvad er Burger Kings slogan?", points: 2,  answer: "Have It Your Way"),
        Question(description: "Hvad er L'Oreals slogan?", points: 2,  answer: "Because you're worth it"),
        Question(description: "Hvad hedder tigeren i Peter Plys?", points: 3,  answer: "Tigerdyr"),
        Question(description: "Tegn tre dyr. Dem der først gætter det må give en tår væk. De må ikke give til tegneren.", points: 3,  answer: "🐯🐶🐣"),
        Question(description: "Nyn din yndlingssang", points: 1,  answer: "🎶"),
        Question(description: "Mim en berømt. Du kan se hvem du skal mime i svarfeltet.", points: 2,  answer: "Mette Frederiksen"),
        Question(description: "Lærke er ...", points: 3,  answer: "💆🏼‍♀️"),
        Question(description: "Sten, Saks, Papir", points: 2,  answer: "🗿✂️📄"),
        Question(description: "Kategori", points: 3,  answer: "Ting"),
        Question(description: "Hvilket fodboldhold er Lærke fan af?", points: 3,  answer: "Manchester City"),
        Question(description: "Hvem er Lærkes yndlings fodboldspiller?", points: 3,  answer: "Spørg Lærke"),
    ]
    
    var primaryColor = UIColor(red: 184 / 255.0, green: 184 / 255.0, blue: 184 / 255, alpha: 1.0)
    var secondaryColor = UIColor(red: 150 / 255.0, green: 150 / 255.0, blue: 200 / 255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleButton(button: wrongAnswerButton)
        styleButton(button: correctAnswerButton)
        styleButton(button: showAnswerButton)
        //styleView(view: leaderboardLabel)
        styleView(view: activePlayerLabel)
        styleView(view: questionLabel)
        styleView(view: answerLabel)
        refresh()
        view.backgroundColor = primaryColor
        //setBackgroundGradient()
    }
    
    private func setBackgroundGradient() {
        let colorTop = UIColor.darkGray.cgColor
        let colorBottom = UIColor.lightGray.cgColor

        let gradient = CAGradientLayer()
        gradient.colors = [colorBottom, colorTop, colorBottom]
        gradient.frame = self.view.bounds
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    private func refresh() {
        let sortedPlayers = players.sorted{$0.points > $1.points}
        updateLeaderBoard(firstPlace: sortedPlayers[0], secondPlace: sortedPlayers[1], thirdPlace: sortedPlayers[2])
        answerLabel.isHidden = true
        let previousPlayer = activePlayerLabel.text
        currentPlayer = players.randomElement()!
        while(previousPlayer == "\(currentPlayer!.name) \(currentPlayer!.emoji)") {
            currentPlayer = players.randomElement()!
        }
        if(questions.isEmpty) {
            questionLabel.text = "Det var det sidste spørgsmål"
            answerLabel.text = "Vi har ikke flere svar 😱"
            activePlayerLabel.text = "Færdig"
        } else {
            currentQuestion = questions.randomElement()!
            questions = questions.filter{$0.description != currentQuestion!.description}
            let newQuestion = "\(currentQuestion!.description)\n\nDer er \(currentQuestion!.points) point på spil."
            changeText(newText: newQuestion, label: questionLabel)
            changeText(newText: currentQuestion!.answer, label: answerLabel)
            changeText(newText: "\(currentPlayer!.name) \(currentPlayer!.emoji)", label: activePlayerLabel)
        }
        setShowAnswerButtonImage(isHidden: true)
    }
    
    fileprivate func styleButton(button: UIButton) {
        button.layer.masksToBounds = false
        button.layer.cornerRadius = button.frame.size.width / 2
        button.tintColor = .white
        button.backgroundColor = secondaryColor
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
    }
    
    fileprivate func styleView(view: UILabel) {
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        view.clipsToBounds = false
        view.backgroundColor = secondaryColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.5
    }
    
    fileprivate func changeText(newText: String, label: UILabel) {
        UIView.transition(with: label, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            [] in label.text = newText
        }, completion: nil)
    }
    
    fileprivate func updateLeaderBoard(firstPlace: Player, secondPlace: Player, thirdPlace: Player) {
        UIView.transition(with: firstPlaceStackView, duration: 0.5, options: .transitionFlipFromBottom, animations: {
            [] in
            self.firstPlaceNameLabel.text = "🥇 \(firstPlace.name)"
            self.firstPlaceEmojiLabel.text = firstPlace.emoji
            self.firstPlacePointsLabel.text = String(firstPlace.points)
        }, completion: nil)
        
        UIView.transition(with: secondPlaceStackView, duration: 0.5, options: .transitionFlipFromBottom, animations: {
            [] in
            self.secondPlaceNameLabel.text = "🥈 \(secondPlace.name)"
            self.secondPlaceEmojiLabel.text = secondPlace.emoji
            self.secondPlacePointsLabel.text = String(secondPlace.points)
        }, completion: nil)
        
        UIView.transition(with: thirdPlaceStackView, duration: 0.5, options: .transitionFlipFromBottom, animations: {
            [] in
            self.thirdPlaceNameLabel.text = "🥉 \(thirdPlace.name)"
            self.thirdPlaceEmojiLabel.text = thirdPlace.emoji
            self.thirdPlacePointsLabel.text = String(thirdPlace.points)
        }, completion: nil)
    }
    
    @IBAction func showAnswerPressed(_ sender: Any) {
        let frame = answerLabel.frame
        let isHidden = answerLabel.isHidden
        if(isHidden) {
            answerLabel.frame = CGRect(x: -400, y: frame.origin.y, width: frame.width, height: frame.height)
            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .transitionCrossDissolve, animations: {
                self.answerLabel.isHidden = false
                self.answerLabel.frame = frame
                self.setShowAnswerButtonImage(isHidden: false)
            }, completion: {_ in
            })
        } else {
            
            UIView.animate(withDuration: 2, delay: 0, options: .transitionCrossDissolve, animations: {
                self.answerLabel.frame = frame
                self.answerLabel.isOpaque = true
                self.answerLabel.layer.opacity = 0
                self.setShowAnswerButtonImage(isHidden: true)
            }, completion: {_ in
                self.answerLabel.isHidden = true
                self.answerLabel.isOpaque = false
                self.answerLabel.layer.opacity = 1
            })
        }
    }
    
    private func setShowAnswerButtonImage(isHidden: Bool) {
        let imageName = isHidden ? "eye.circle.fill" : "eye.slash.circle.fill"
        showAnswerButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @IBAction func correctAnswerPressed(_ sender: Any) {
        createEmojis(emojis: ["🎉": 50, "🥳": 30, "🎈": 40, "🍾": 25, "🤓": 35, "✅": 40])
        currentPlayer!.points += currentQuestion!.points
        refresh()
    }
    
    @IBAction func wrongAnswerPressed(_ sender: Any) {
        createEmojis(emojis: ["💩": 50])
        refresh()
    }
    
    private func createEmojis(emojis: [String: Int]) {
        for _ in 1...50 {
            let size = emojis.randomElement()!.value
            let startingPoint = Int.random(in: 20..<Int(self.view.frame.width))
            let endPoint = Int.random(in: 20..<Int(self.view.frame.width))
            let emojiLabelView = UILabel(frame: CGRect(x: startingPoint, y: Int(self.view.frame.height), width: size, height: size))
            emojiLabelView.font = UIFont.systemFont(ofSize: CGFloat(size))
            self.view.addSubview(emojiLabelView)
            emojiLabelView.text = emojis.randomElement()!.key
            
            UIView.animate(withDuration: Double.random(in: 1..<5), animations: {
                emojiLabelView.frame.origin.x = CGFloat(endPoint)
                emojiLabelView.frame.origin.y = -100
            }, completion: {_ in
                emojiLabelView.removeFromSuperview()
            })
            
        }
    }
}

