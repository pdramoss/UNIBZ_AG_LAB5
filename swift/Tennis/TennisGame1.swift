import Foundation

class TennisGame1: TennisGame {
    var playerOne: Player
    var playerTwo: Player
    
    required init(playerOne: Player, playerTwo: Player) {
        self.playerOne = playerOne
        self.playerTwo = playerTwo
    }
    
    struct Constants {
        static let wonPointValue: Int = 1
        static let minimumToWinValue: Int = 4
        
        static let playerPointLove = 0
        static let playerPointFifteen = 1
        static let playerPointThirty = 2
        static let playerPointForty = 3
        
        struct description {
            static let guion = "-"
            static let love = "Love"
            static let fifteen = "Fifteen"
            static let thirty = "Thirty"
            static let forty = "Forty"
            static let loveAll = "Love-All"
            static let fifteenAll = "Fifteen-All"
            static let thirtyAll = "Thirty-All"
            static let deuce = "Deuce"
            static let advantagePlayer1 = "Advantage player1"
            static let advantagePlayer2 = "Advantage player2"
            static let winPlayer1 = "Win for player1"
            static let winPlayer2 = "Win for player2"
        }
    }
    
    func wonPoint(_ player: Player) {
        if playerOne.name == player.name {
            playerOne.score += Constants.wonPointValue
        } else {
            playerTwo.score += Constants.wonPointValue
        }
    }
    
    var score: String? {
        if playerOne.score == playerTwo.score {
            return validateTypeOfDeuce(playerOne)
        } else if (playerOne.score >= Constants.minimumToWinValue) || (playerTwo.score >= Constants.minimumToWinValue) {
            return solveDeuceGame(playerOne, playerTwo)
        } else {
            return currentScore(playerOne, playerTwo)
        }
    }
    
    private func currentScore(_ playerOne: Player, _ playerTwo: Player) -> String {
        var score = ""
        for i in 1..<3 {
            score = i == 1 ? score : score + Constants.description.guion
            
            switch i == 1 ? playerOne.score : playerTwo.score {
            case Constants.playerPointLove:
                score = score + Constants.description.love
            case Constants.playerPointFifteen:
                score = score + Constants.description.fifteen
            case Constants.playerPointThirty:
                score = score + Constants.description.thirty
            case Constants.playerPointForty:
                score = score + Constants.description.forty
                
            default:
                break
            }
        }
        return score
    }
    
    private func validateTypeOfDeuce(_ playerOne: Player) -> String {
        switch playerOne.score {
        case Constants.playerPointLove:
            return Constants.description.loveAll
        case Constants.playerPointFifteen:
            return Constants.description.fifteenAll
        case Constants.playerPointThirty:
            return Constants.description.thirtyAll
        default:
            return Constants.description.deuce
        }
    }
    
    private func solveDeuceGame(_ playerOne: Player, _ playerTwo: Player) -> String {
        let minusResult = playerOne.score - playerTwo.score
        switch true {
        case minusResult == 1:
            return Constants.description.advantagePlayer1
        case minusResult  == -1:
            return Constants.description.advantagePlayer2
        case minusResult>=2:
            return Constants.description.winPlayer1
        default:
            return Constants.description.winPlayer2
        }
    }
}
