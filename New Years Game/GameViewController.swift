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
    @IBOutlet weak var leaderboardLabel: UILabel!
    
    var players = [Player(name: "Seb", emoji: "👨🏼‍💻"), Player(name: "Amalie", emoji: "👩‍👧‍👦"),
        Player(name: "Laura", emoji: "👩‍👧‍👦"), Player(name: "Niklas", emoji: "👩🏼‍🚒"),
        Player(name: "Lærke", emoji: "💆🏼‍♀️"), Player(name: "Henrik", emoji: "👨🏼‍🍳"),
        Player(name: "Henriks søn", emoji: "⛹🏼")]
    var currentQuestion: Question?
    var currentPlayer: Player?
    
    var questions = [
        Question(description: "Hvad går den anden leg i Squid Game ud på?", points: 2,  answer: "Tug of war/Tovtrækning"),
        Question(description: "Hvem er ældst?", points: 5,  answer: "Jonas"),
        Question(description: "Hvilket år gik Emilie ud af gymnasiet?", points: 2,  answer: "Emilie kender svaret"),
        Question(description: "Hvad er en Amager plade?", points: 2,  answer: "En tatovering lige over røven 🍑"),
        Question(description: "Hvad siger folk fra Amager når de sværger?", points: 2,  answer: "Amager halshug"),
        Question(description: "Hvad er det mærkeligste du nogensinde har drømt?", points: 2,  answer: "❓"),
        Question(description: "Hvem er sejest?", points: 2,  answer: "Seb 😊"),
        Question(description: "Fortæl to sandheder og en løgn", points: 3,  answer: "❓"),
        Question(description: "Hvor langt nåede det danske fodboldslandshold til EM og hvem slog dem ud?", points: 2,  answer: "Semifinalerne. De blev slået ud af England."),
        Question(description: "Hvem blev den første private borger til at rejse ud i rummet i deres eget rumskib?", points: 2,  answer: "Richard Branson. Han gjorde det 9 dage før Jeff Bezos."),
        Question(description: "Hvad er det vildste du har gjort i dit liv?", points: 2,  answer: "❓"),
        Question(description: "Hvilket job forestillede du dig du skulle have da du var barn?", points: 1,  answer: "❓"),
        Question(description: "Hvis du kunne vælge en superkræft, hvad skulle det så være og hvorfor?", points: 2,  answer: "❓"),
        Question(description: "Hvor mange mål lukkede det danske fodboldslandshold ind i VM kvalifikationen?", points: 1,  answer: "3"),
        Question(description: "Hvad bliver det legendariske Arsenal hold fra 2004-2004 sæsonen kaldt?", points: 2,  answer: "The Invincibles 🏆"),
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
        Question(description: "Jegt har aldrig med 3 liv. Du starter.", points: 3,  answer: "❓"),
        Question(description: "Nyn din yndlingssang", points: 1,  answer: "🎶"),
        Question(description: "Mim en berømt. Du kan se hvem du skal mime i svarfeltet.", points: 2,  answer: "Mette Frederiksen"),
        Question(description: "Min fisse er ...", points: 3,  answer: "❓"),
        Question(description: "Lærke er ...", points: 3,  answer: "💆🏼‍♀️"),
        Question(description: "Sten, Saks, Papir", points: 2,  answer: "🗿✂️📄"),
        Question(description: "Kategori", points: 3,  answer: "Ting"),
        Question(description: "Hvilket fodboldhold er Lærke fan af?", points: 3,  answer: "Manchester City"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wrongAnswerButton.setTitle("Forkert svar", for: .normal)
        styleButton(button: wrongAnswerButton, text: "Forkert svar", cornerRadius: 5)
        styleButton(button: correctAnswerButton, text: "Rigtigt svar", cornerRadius: 5)
        let showAnswerCornerRadius = showAnswerButton.frame.size.width / 2
        styleButton(button: showAnswerButton, text: "Vis svar", cornerRadius: showAnswerCornerRadius)
        refresh()
    }
    
    private func refresh() {
        let sortedPlayers = players.sorted{$0.points > $1.points}
        let firstPlacePlayer = sortedPlayers[0]
        let secondPlacePlayer = sortedPlayers[1]
        let thirdPlacePlayer = sortedPlayers[2]
        let firstPlace = "🥇 \(firstPlacePlayer.name) \(firstPlacePlayer.emoji): \(firstPlacePlayer.points)\n\n"
        let secondPlace = "🥈 \(secondPlacePlayer.name) \(secondPlacePlayer.emoji): \(secondPlacePlayer.points)\n\n"
        let thirdPlace = "🥉 \(thirdPlacePlayer.name) \(thirdPlacePlayer.emoji): \(thirdPlacePlayer.points)"
        changeText(newText: "\(firstPlace)\(secondPlace)\(thirdPlace)", label: leaderboardLabel)
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
            let points = currentQuestion!.points == 1 ? "tår" : "tåre"
            let newQuestion = "\(currentQuestion!.description)\n\nTag \(currentQuestion!.points) \(points) hvis du svarer forkert eller ikke vil svare ❌\n\nGiv 1 tår væk hvis du svarer rigtigt ✅"
            changeText(newText: newQuestion, label: questionLabel)
            changeText(newText: currentQuestion!.answer, label: answerLabel)
            changeText(newText: "\(currentPlayer!.name) \(currentPlayer!.emoji)", label: activePlayerLabel)
        }
    }
    
    fileprivate func styleButton(button: UIButton, text: String, cornerRadius: Double) {
        button.setTitle(text, for: .normal)
        button.layer.masksToBounds = false
        button.layer.cornerRadius = cornerRadius
        button.clipsToBounds = true
    }
    
    fileprivate func changeText(newText: String, label: UILabel) {
        UIView.transition(with: label, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            [] in label.text = newText
        }, completion: nil)
    }
    
    @IBAction func showAnswerPressed(_ sender: Any) {
        answerLabel.isHidden = !answerLabel.isHidden
        UIView.transition(with: answerLabel, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            [] in
        }, completion: nil)
    }
    
    @IBAction func correctAnswerPressed(_ sender: Any) {
        createEmojis(emojis: ["🎉": 50, "🥳": 30, "🎈": 40, "🍾": 25, "🤓": 35])
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

