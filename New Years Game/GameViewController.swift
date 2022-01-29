import UIKit

class GameViewController: UIViewController{
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
    @IBOutlet weak var activePlayerView: UIView!
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var answerView: UIView!
    
    var players: [Player]!
    var currentQuestion: Question?
    var currentPlayer: Player?
    var currentIndex = 0
    var isRandom = false
    
    var primaryColor = UIColor(red: 105 / 255.0, green: 219 / 255.0, blue: 204 / 255, alpha: 1.0)
    var secondaryColor = UIColor(red: 137 / 255.0, green: 210 / 255.0, blue: 224 / 255, alpha: 1.0)
    
    var questions = [
        Question(description: "Hvad går den tredje leg i Squid Game ud på?", points: 1,  answer: "Tug of war/Tovtrækning", id: 0),
        Question(description: "Hvem er ældst?", points: 1,  answer: "Henrik", id: 1),
        Question(description: "Hvad er en Amager plade?", points: 1,  answer: "En tatovering lige over røven 🍑", id: 2),
        Question(description: "Hvad siger folk fra Amager når de sværger?", points: 1,  answer: "Amager halshug", id: 3),
        Question(description: "Hvad er det mærkeligste du nogensinde har drømt?", points: 1,  answer: "❓", id: 4),
        //Question(description: "Hvem er sejest?", points: 1,  answer: "Amalie 😊", id: 5),
        Question(description: "Fortæl to løgne og en sandhed.\nDe andre skal gætte som en gruppe. Du får point hvis de gætter forkert.", points: 1,  answer: "❓", id: 6),
        Question(description: "Fortæl to løgne og en sandhed.\nDe andre skal gætte som en gruppe. Du får point hvis de gætter forkert.", points: 1,  answer: "❓", id: 7),
        Question(description: "Hvor langt nåede det danske fodboldslandshold til EM 2020 og hvem slog dem ud?", points: 1,  answer: "Semifinalerne. De blev slået ud af England.", id: 8),
        Question(description: "Hvem blev den første private borger til at rejse ud i rummet i deres eget rumskib?", points: 1,  answer: "Richard Branson. Han gjorde det 9 dage før Jeff Bezos.", id: 9),
        Question(description: "Hvad er det vildste du har gjort i dit liv?", points: 1,  answer: "❓", id: 10),
        Question(description: "Hvilket job forestillede du dig du skulle have da du var barn?", points: 1,  answer: "❓", id: 11),
        Question(description: "Hvis du kunne vælge en superkræft, hvad skulle det så være og hvorfor?", points: 1,  answer: "❓", id: 12),
        //Question(description: "Hvor mange mål lukkede det danske fodboldslandshold ind i VM kvalifikationen til Qatar 2022?", points: 1,  answer: "3", id: 13),
        //Question(description: "Hvad bliver det legendariske Arsenal hold fra 2003-2004 sæsonen kaldt?", points: 1,  answer: "The Invincibles 🏆", id: 14),
        Question(description: "Hvad er det dummeste du har gjort mens du var fuld?", points: 1,  answer: "🍻❓", id: 15),
        Question(description: "Hvad er den mest irriterende vane du har?", points: 1,  answer: "🤬❓", id: 16),
        Question(description: "Hvad er det dummeste du har gjort som barn?", points: 1,  answer: "👶🏼❓", id: 17),
        Question(description: "Hvad er det pinligste du har grædt over?", points: 1,  answer: "❓", id: 18),
        Question(description: "Hvilket dyr minder mest om din højre sidemand og hvorfor?", points: 1,  answer: "❓", id: 19),
        Question(description: "Hvad kommer efter 20?", points: 1,  answer: "Politi 🚓", id: 20),
        Question(description: "Hvad kommer efter 20?", points: 1,  answer: "21", id: 21),
        Question(description: "Hvor gammel er Beyonce?", points: 1,  answer: "40", id: 22),
        //Question(description: "Bum leg", points: 1,  answer: "Bum", id: 23),
        Question(description: "Finish the lyrics\nOtto Brandenburg: Jeg ved en ... jeg siger ikke mer", points: 1,  answer: "lærkerede 🕊", id: 24),
        Question(description: "Finish the lyrics\nEd Sheeran: My bad habits lead to ...", points: 1,  answer: "late nights ending alone", id: 25),
        Question(description: "Finish the lyrics\nPSY: Oppan Ganganm Style ...", points: 1,  answer: "Ehhh sexy lady", id: 26),
        Question(description: "Finish the lyrics In the jungle, the mighty jungle ...", points: 1,  answer: "the lion sleeps tonight 🦁", id: 27),
        //Question(description: "Hvem blev kåret til den bedste kvindelige fodboldspiller i 2021?", points: 1,  answer: "Alexia Putellas ⚽️", id: 27),
        Question(description: "Hvilken placering fik det danske kvindehåndboldshold til VM i 2021?", points: 1,  answer: "Bronze 🥉", id: 28),
        Question(description: "Hvad er Bilkas slogan?", points: 1,  answer: "Hvem ka' Bilka", id: 29),
        Question(description: "Hvad er Burger Kings slogan?", points: 1,  answer: "Have It Your Way", id: 30),
        Question(description: "Hvad er L'Oreals slogan?", points: 1,  answer: "Because you're worth it", id: 31),
        Question(description: "Hvad hedder tigeren i Peter Plys?", points: 1,  answer: "Tigerdyr", id: 32),
        Question(description: "Tegn et dyr. Hvis dyret bliver gættet får tegneren point. Du kan se hvad du skal tegne i svar feltet.", points: 1,  answer: "Tegn en Kameleon", id: 33),
        Question(description: "Tegn et dyr. Hvis dyret bliver gættet får tegneren point. Du kan se hvad du skal tegne i svar feltet.", points: 1,  answer: "Tegn en Klovnefisk", id: 34),
        Question(description: "Nyn din yndlingssang", points: 1,  answer: "🎶", id: 35),
        Question(description: "Mim en berømt. Du kan se hvem du skal mime i svarfeltet.", points: 1,  answer: "Mette Frederiksen", id: 36),
        Question(description: "Lærke er ...", points: 1,  answer: "💆🏼‍♀️", id: 37),
        Question(description: "Sten, Saks, Papir", points: 1,  answer: "🗿✂️📄", id: 38),
        Question(description: "Kategori", points: 1, answer: "Ting", id: 39),
        Question(description: "Kategori", points: 1, answer: "Ting", id: 40),
        Question(description: "Hvilket fodboldhold er Lærke fan af?", points: 1,  answer: "Manchester City 🔵", id: 41),
        Question(description: "Hvem er Lærkes yndlings fodboldspiller?", points: 1,  answer: "Spørg Lærke", id: 42),
        //Question(description: "Hvad er Arsenals motto?", points: 1,  answer: "Victoria Concordia Crescit(Victory Through Harmony)", id: 43),
        Question(description: "Hvor gammel bliver Lærke?", points: 1,  answer: "50, men hun ser ikke ud som en dag over 25 😯", id: 44),
        Question(description: "Hvem er Lærkes yndlings svigersøn?", points: 1,  answer: "Det er selvfølgelig både Niklas og Seb 🤝", id: 45),
        Question(description: "Hvor mange Spider-Man film er der lavet med de tre nyeste skuspillere i rollen(Toby Maguire, Andrew Garfield, Tom Holland)?", points: 1,  answer: "8 🕷", id: 46),
        Question(description: "Hvad hedder den andelsforening Lærke bor i?", points: 1,  answer: "A/B Sandkagen 🍰", id: 47),
        Question(description: "Hvor gammel er Mini?", points: 1,  answer: "Spørg Lærke 🐩", id: 48),
        Question(description: "Hvad hedder Laura og Niklas hund?", points: 1,  answer: "Sofus 🐶", id: 49),
        Question(description: "Hvad hedder ham den lækre sundhedsminister?", points: 1,  answer: "Magnus Heunicke 😍", id: 50),
        Question(description: "I maj 2021 tog Lærke en tur med nogle veninder. Hvor tog hun hen?", points: 1,  answer: "Buddhi Camp 😋", id: 51),
        Question(description: "Hvilke karakterer fik Amalie og Laura i deres bachelor eksamener?", points: 1,  answer: "12 og 12 👩🏼‍🎓👩🏼‍🎓", id: 52),
        Question(description: "Hvad er Mette Frederiksens mellemnavn?", points: 1,  answer: "Hun har ikke et mellemnavn", id: 53),
        //Question(description: "Hvem vandt 3F Superligaen i 20/21?", points: 1,  answer: "Brøndby IF", id: 53),
        Question(description: "Hvilken dansk film vandt Oscaren for Bedste internationale film i 2021?", points: 1,  answer: "Druk(Another Round)", id: 54),
        Question(description: "Fortæl en løgn som du på et tidspunkt har fortalt til dine mor eller far", points: 1, answer: "🙈", id: 55),
        Question(description: "Nævn 1 ting, som du sætter pris på fra sin barndom", points: 1, answer: "👧🏼👦🏼", id: 56),
        Question(description: "Hvad er Lærkes yndlingsfarve?", points: 1, answer: "Grøn💚", id: 57),
        Question(description: "Hvad er Tivolis slogan?", points: 1, answer: "Altid som aldrig før", id: 58),
        Question(description: "Hvor gammle var Lærke da hun fik sin første kæreste?", points: 1, answer: "Spørg Lærke", id: 59),
        Question(description: "Finish the Lyrics\nNik & Jay: Undskyld mig baby, har jeg ...", points: 1, answer: "set dig før, et sted i København", id: 60)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationController?.isNavigationBarHidden = true
        styleButton(button: wrongAnswerButton)
        styleButton(button: correctAnswerButton)
        styleButton(button: showAnswerButton)
        styleView(view: leaderboardView)
        styleView(view: activePlayerView)
        activePlayerLabel.backgroundColor = .clear
        
        styleView(view: questionView)
        questionLabel.backgroundColor = .clear
        
        styleView(view: answerView)
        answerLabel.backgroundColor = .clear
        for view in firstPlaceStackView.subviews {
            view.backgroundColor = .clear
        }
        for view in secondPlaceStackView.subviews {
            view.backgroundColor = .clear
        }
        for view in thirdPlaceStackView.subviews {
            view.backgroundColor = .clear
        }
        firstPlaceNameLabel.text = "🥇 \(players[0].name)"
        firstPlaceEmojiLabel.text = players[0].emoji
        firstPlacePointsLabel.text = String(players[0].points)
        
        secondPlaceNameLabel.text = "🥈 \(players[1].name)"
        secondPlaceEmojiLabel.text = players[1].emoji
        secondPlacePointsLabel.text = String(players[1].points)
        
        thirdPlaceNameLabel.text = "🥉 \(players[2].name)"
        thirdPlaceEmojiLabel.text = players[2].emoji
        thirdPlacePointsLabel.text = String(players[2].points)
        refresh(correctAnswer: false, isFirstQuestion: true)
        view.backgroundColor = primaryColor
    }
    
    private func setBackgroundGradient() {
        let colorTop = UIColor.darkGray.cgColor
        let colorBottom = UIColor.lightGray.cgColor

        let gradient = CAGradientLayer()
        gradient.colors = [colorBottom, colorTop, colorBottom]
        gradient.frame = self.view.bounds
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    private func refresh(correctAnswer: Bool, isFirstQuestion: Bool = false) {
        let sortedPlayers = players.sorted{$0.points > $1.points}
        if(correctAnswer && !questions.isEmpty) {
            createEmojis(emojis: ["🎉": 50, "🥳": 30, "🎈": 40, "🍾": 25, "🤓": 35, "✅": 40, "🤩": 35, "⭐️": 30])
            updateLeaderBoard(firstPlace: sortedPlayers[0], secondPlace: sortedPlayers[1], thirdPlace: sortedPlayers[2])
        } else if(!correctAnswer  && !questions.isEmpty && !isFirstQuestion){
            createEmojis(emojis: ["💩": 50])
        }
        answerView.isHidden = true
        pickPlayer(isFirstQuestion: isFirstQuestion)
        if(questions.isEmpty) {
            createEmojis(emojis: ["🏆": 60, "🇩🇰": 80, "🎁": 70])
            updateLeaderBoard(firstPlace: sortedPlayers[0], secondPlace: sortedPlayers[1], thirdPlace: sortedPlayers[2])
            let winner = sortedPlayers[0]
            var rankings = ""
            for index in 0..<sortedPlayers.count {
                let player = sortedPlayers[index]
                rankings = "\(rankings)\n\(index + 1). \(player.name) \(player.emoji): \(player.points)"
            }
            questionLabel.text = "Det var det sidste spørgsmål\nVinderen er \(winner.name) \(winner.emoji)🏆 med \(winner.points) point!\(rankings)"
            answerLabel.text = "Vi har ikke flere svar 😱"
            activePlayerLabel.text = "🏆"
        } else {
            currentQuestion = questions.randomElement()!
            questions = questions.filter{$0.id != currentQuestion!.id}
            let newQuestion = "\(currentQuestion!.description)\n\nDer er \(currentQuestion!.points) point på spil."
            changeText(newText: newQuestion, label: questionLabel, view: questionView)
            answerLabel.text = currentQuestion!.answer
            changeText(newText: "\(currentPlayer!.name) \(currentPlayer!.emoji)", label: activePlayerLabel, view: activePlayerView)
        }
        setShowAnswerButtonImage(isHidden: true)
    }
    
    private func pickPlayer(isFirstQuestion: Bool) {
        if(isRandom) {
            let previousPlayer = activePlayerLabel.text
            currentPlayer = players.randomElement()!
            while(previousPlayer == "\(currentPlayer!.name) \(currentPlayer!.emoji)") {
                currentPlayer = players.randomElement()!
            }
        } else {
            if(isFirstQuestion) {
                currentPlayer = players[0]
            } else {
                let nextIndex = currentIndex == players.count - 1 ? 0 : currentIndex + 1
                currentPlayer = players[nextIndex]
                currentIndex = nextIndex
            }
        }
    }
    
    fileprivate func styleButton(button: UIButton) {
        button.setTitle("", for: .normal
        )
        button.layer.masksToBounds = false
        button.layer.cornerRadius = button.frame.size.width / 2
        button.tintColor = .white
        button.backgroundColor = secondaryColor
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
    }
    
    fileprivate func styleView(view: UIView) {
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        view.clipsToBounds = false
        view.backgroundColor = secondaryColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.5
    }
    
    fileprivate func changeText(newText: String, label: UILabel, view: UIView) {
        UIView.transition(with: view, duration: 0.5, options: .transitionFlipFromLeft, animations: {
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
        let frame = answerView.frame
        let isHidden = answerView.isHidden
        if(isHidden) {
            slideAnswerIn(frame: frame)
        } else {
            fadeAnswerOut(frame: frame)
        }
    }
    
    private func slideAnswerIn(frame: CGRect) {
        answerView.frame = CGRect(x: -400, y: frame.origin.y, width: frame.width, height: frame.height)
        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .transitionCrossDissolve, animations: {
            self.answerView.isHidden = false
            self.answerView.frame = frame
            self.setShowAnswerButtonImage(isHidden: false)
        }, completion: {_ in
        })
    }
    
    private func fadeAnswerOut(frame: CGRect) {
        UIView.animate(withDuration: 2, delay: 0, options: .transitionCrossDissolve, animations: {
            self.answerView.frame = frame
            self.answerView.isOpaque = true
            self.answerView.layer.opacity = 0
            self.setShowAnswerButtonImage(isHidden: true)
        }, completion: {_ in
            self.answerView.isHidden = true
            self.answerView.isOpaque = false
            self.answerView.layer.opacity = 1
        })
    }
    
    private func setShowAnswerButtonImage(isHidden: Bool) {
        let imageName = isHidden ? "eye.circle.fill" : "eye.slash.circle.fill"
        showAnswerButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @IBAction func correctAnswerPressed(_ sender: Any) {
        currentPlayer!.points += currentQuestion!.points
        refresh(correctAnswer: true)
    }
    
    @IBAction func wrongAnswerPressed(_ sender: Any) {
        refresh(correctAnswer: false)
    }
    
    private func createEmojis(emojis: [String: Int]) {
        for _ in 1...100 {
            let size = emojis.randomElement()!.value
            let startingPoint = Int.random(in: 0..<Int(self.view.frame.width))
            let endPoint = Int.random(in: -20..<Int(self.view.frame.width))
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

