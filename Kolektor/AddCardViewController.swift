//
//  AddCardViewController.swift
//  Kolektor
//
//  Created by Hocky on 28/04/22.
//

import UIKit

class AddCardViewController: UIViewController {

    @IBOutlet weak var labelAddCard: UILabel!
    @IBOutlet weak var fieldCardSeries: UITextField!
    @IBOutlet weak var fieldCardName: UITextField!
    @IBOutlet weak var fieldCardID: UITextField!
    @IBOutlet weak var fieldCardRarity: UITextField!
    @IBOutlet weak var fieldCardPrice: UITextField!
    @IBOutlet weak var fieldCardWishability: UITextField!
    @IBAction func buttonConfirmAddCard(_ sender: UIButton) {
        addCard()
        performSegue(withIdentifier: "unwindtoMain", sender: self)
    }
    
    
    var cardList: [Card] = []
    var seriesList: [Series] = []
    var card: Card?
    var series: Series?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addCard(){
        card = Card(series: fieldCardSeries.text ?? "Empty", id: fieldCardID.text ?? "Empty", name: fieldCardName.text ?? "Empty", rarity: fieldCardRarity.text ?? "Empty", price: fieldCardPrice.text ?? "Empty", wish: fieldCardWishability.text ?? "Empty")
        cardList.append(card!)
        var contained = false
        for x in seriesList{
            if x.name == fieldCardSeries.text{
                contained = true
            }
        }
        if !contained{
            series = Series(name: fieldCardSeries.text!)
            seriesList.append(series!)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindtoMain" {
            let destinationViewController = segue.destination as? ViewController
            destinationViewController?.cardList = self.cardList
            destinationViewController?.seriesList = self.seriesList
        }
    }

}
