import Foundation

class TennisGame3: TennisGame {
    var playerOne: Player
    var playerTwo: Player
    
    private var p1: Int
    private var p2: Int
    
    required init(playerOne: Player, playerTwo: Player) {
        self.playerOne = playerOne
        self.playerTwo = playerTwo
        p1 = 0
        p2 = 0
    }
    
    var score: String? {
        var s: String
        if (p1 < 4 && p2 < 4) && (p1 + p2 < 6) {
            let p = ["Love", "Fifteen", "Thirty", "Forty"]
            s = p[p1];
            return (p1 == p2) ? "\(s)-All" : "\(s)-\(p[p2])"
        } else {
            if (p1 == p2)
            { return "Deuce" }
            s = p1 > p2 ? playerOne.name : playerTwo.name;
            return ((p1-p2)*(p1-p2) == 1) ? "Advantage \(s)" : "Win for \(s)"
        }
    }
    
    func wonPoint(_ player: Player) {
        if playerOne.name == player.name {
            p1 += 1
        } else {
            p2 += 1
        }
    }
}
