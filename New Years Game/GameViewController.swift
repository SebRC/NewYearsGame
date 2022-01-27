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
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var showAnswerButton: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    
    var players = [Player(name: "Seb", emoji: "👨🏼‍💻"), Player(name: "Amalie", emoji: "👩‍👧‍👦"),
        Player(name: "Laura", emoji: "👩‍👧‍👦"), Player(name: "Niklas", emoji: "👩🏼‍🚒"),
        Player(name: "Lærke", emoji: "💆🏼‍♀️"), Player(name: "Henrik", emoji: "👨🏼‍🍳"),
        Player(name: "Henriks søn", emoji: "⛹🏼")]
    
    var questions = [
        Question(description: "Hvad går den anden leg i Squid Game ud på?", sips: 2,  answer: "Tug of war/Tovtrækning"),
        Question(description: "Hvem er ældst?", sips: 5,  answer: "Jonas"),
        Question(description: "Hvilket år gik Emilie ud af gymnasiet?", sips: 2,  answer: "Emilie kender svaret"),
        Question(description: "Hvad er en Amager plade?", sips: 2,  answer: "En tatovering lige over røven 🍑"),
        Question(description: "Hvad siger folk fra Amager når de sværger?", sips: 2,  answer: "Amager halshug"),
        Question(description: "Hvad er det mærkeligste du nogensinde har drømt?", sips: 2,  answer: "❓"),
        Question(description: "Hvem er sejest?", sips: 2,  answer: "Seb 😊"),
        Question(description: "Fortæl to sandheder og en løgn", sips: 3,  answer: "❓"),
        Question(description: "Hvor langt nåede det danske fodboldslandshold til EM og hvem slog dem ud?", sips: 2,  answer: "Semifinalerne. De blev slået ud af England."),
        Question(description: "Hvem blev den første private borger til at rejse ud i rummet i deres eget rumskib?", sips: 2,  answer: "Richard Branson. Han gjorde det 9 dage før Jeff Bezos."),
        Question(description: "Hvad er det vildste du har gjort i dit liv?", sips: 2,  answer: "❓"),
        Question(description: "Hvilket job forestillede du dig du skulle have da du var barn?", sips: 1,  answer: "❓"),
        Question(description: "Hvis du kunne vælge en superkræft, hvad skulle det så være og hvorfor?", sips: 2,  answer: "❓"),
        Question(description: "Hvor mange mål lukkede det danske fodboldslandshold ind i VM kvalifikationen?", sips: 1,  answer: "3"),
        Question(description: "Hvad bliver det legendariske Arsenal hold fra 2004-2004 sæsonen kaldt?", sips: 2,  answer: "The Invincibles 🏆"),
        Question(description: "Hvad er det dummeste du har gjort mens du var fuld?", sips: 2,  answer: "🍻❓"),
        Question(description: "Hvad er den mest irriterende vane du har?", sips: 5,  answer: "🤬❓"),
        Question(description: "Hvad er det dummeste du har gjort som barn?", sips: 3,  answer: "👶🏼❓"),
        Question(description: "Hvad er det pinligste du har grædt over?", sips: 1,  answer: "❓"),
        Question(description: "Hvilket dyr minder mest om din højre sidemand og hvorfor?", sips: 2,  answer: "❓"),
        Question(description: "Hvad kommer efter 20?", sips: 2,  answer: "Politi 🚓"),
        Question(description: "Hvad kommer efter 20?", sips: 2,  answer: "21"),
        Question(description: "Hvor gammel er Beyonce?", sips: 2,  answer: "40"),
        Question(description: "Bum leg", sips: 3,  answer: "Bum"),
        Question(description: "Finish the lyrics:\nLil Nas X Send her back to her boyfriend with my handprint on her ...", sips: 2,  answer: "ass cheek"),
        Question(description: "Finish the lyrics:\nEd Sheeran My bad habits lead to ...", sips: 2,  answer: "late nights ending alone"),
        Question(description: "Finish the lyrics:\nPSY Oppan Ganganm Style ...", sips: 2,  answer: "Ehhh sexy lady"),
        Question(description: "Finish the lyrics: In the jungle, the mighty jungle ...", sips: 2,  answer: "the lion sleeps tonight"),
        Question(description: "Hvem blev kåret til den bedste kvindelige fodboldspiller i 2021?", sips: 2,  answer: "Alexia Putellas ⚽️"),
        Question(description: "Hvilken placering fik det danske kvindehåndboldshold til VM?", sips: 2,  answer: "Bronze"),
        Question(description: "Hvad er Bilkas slogan?", sips: 2,  answer: "Hvem ka' Bilka"),
        Question(description: "Hvad er Burger Kings slogan?", sips: 2,  answer: "Have It Your Way"),
        Question(description: "Hvad er L'Oreals slogan?", sips: 2,  answer: "Because you're worth it"),
        Question(description: "Hvad hedder tigeren i Peter Plys?", sips: 3,  answer: "Tigerdyr"),
        Question(description: "Tegn tre dyr. Dem der først gætter det må give en tår væk. De må ikke give til tegneren.", sips: 3,  answer: "🐯🐶🐣"),
        Question(description: "Jegt har aldrig med 3 liv. Du starter.", sips: 3,  answer: "❓"),
        Question(description: "Nyn din yndlingssang", sips: 1,  answer: "🎶"),
        Question(description: "Mim en berømt. Du kan se hvem du skal mime i svarfeltet.", sips: 2,  answer: "Mette Frederiksen"),
        Question(description: "Min fisse er ...", sips: 3,  answer: "❓"),
        Question(description: "Min pik er ...", sips: 3,  answer: "🍆"),
        Question(description: "Sten, Saks, Papir", sips: 2,  answer: "🗿✂️📄"),
        Question(description: "Kategori", sips: 3,  answer: "🗿✂️📄"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleButton(button: nextQuestionButton, text: "Næste")
        styleButton(button: showAnswerButton, text: "Vis svar")
        refresh()
    }
    
    private func refresh() {
        answerLabel.isHidden = true
        let previousPlayer = activePlayerLabel.text;
        var activePlayer = players.randomElement()
        while(previousPlayer == activePlayer!.name) {
            activePlayer = players.randomElement()
        }
        if(questions.isEmpty) {
            questionLabel.text = "Det var det sidste spørgsmål"
            answerLabel.text = "Vi har ikke flere svar 😱"
            activePlayerLabel.text = "Færdig"
        } else {
            let question = questions.randomElement()
            questions = questions.filter{$0.description != question!.description}
            let sips = question!.sips == 1 ? "tår" : "tåre"
            let newQuestion = "\(question!.description)\n\nTag \(question!.sips) \(sips) hvis du svarer forkert eller ikke vil svare ❌\n\nGiv 1 tår væk hvis du svarer rigtigt ✅"
            changeText(newText: newQuestion, label: questionLabel)
            changeText(newText: question!.answer, label: answerLabel)
            changeText(newText: activePlayer!.name, label: activePlayerLabel)
        }
    }
    
    fileprivate func styleButton(button: UIButton, text: String) {
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = false
        button.clipsToBounds = true
        button.layer.cornerRadius = button.frame.size.width / 2
        button.clipsToBounds = true
    }
    
    fileprivate func changeText(newText: String, label: UILabel) {
        UIView.transition(with: label, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            [] in label.text = newText
        }, completion: nil)
    }

    @IBAction func nextQuestionPressed(_ sender: Any) {
        refresh()
    }
    
    @IBAction func showAnswerPressed(_ sender: Any) {
        answerLabel.isHidden = !answerLabel.isHidden
        UIView.transition(with: answerLabel, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            [] in
        }, completion: nil)
    }
}

