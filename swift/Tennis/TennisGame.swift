import Foundation

protocol TennisGame {
    init(playerOne: Player, playerTwo: Player)
    func wonPoint(_ player: Player)
    
    var score: String? { get }
    var playerOne: Player { get set }
    var playerTwo: Player { get set }
}
