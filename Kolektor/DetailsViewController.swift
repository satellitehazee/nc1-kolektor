//
//  DetailsViewController.swift
//  Kolektor
//
//  Created by Hocky on 28/04/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var labelCardHeader: UILabel!
    @IBOutlet weak var labelCardName: UILabel!
    @IBOutlet weak var labelCardID: UILabel!
    @IBOutlet weak var labelCardRarity: UILabel!
    @IBOutlet weak var labelCardPrice: UILabel!
    @IBOutlet weak var labelCardWishability: UILabel!
    @IBAction func buttonMarkAsDone(_ sender: UIButton) {
        removeCard()
        performSegue(withIdentifier: "unwindtoMain", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLabelData()
        // Do any additional setup after loading the view.
    }
    
    var card: Card?
    var cardList: [Card]?
    var seriesList: [Series]?
    
    func loadLabelData(){
        labelCardHeader.text = card?.name
        labelCardID.text = card?.id
        labelCardName.text = card?.name
        labelCardRarity.text = card?.rarity
        labelCardPrice.text = card?.price
        labelCardWishability.text = card?.wish
    }
    
    func removeCard(){
        var idx: Int = 0
        var seriesCount: Int = 0
        for x in cardList!{
            if x.id == card?.id{
                cardList?.remove(at: idx)
            }
            else if x.series == card?.series{
                seriesCount += 1
            }
            idx += 1
        }
        idx = 0
        if seriesCount == 0 {
            for x in seriesList! {
                if x.name == card?.series {
                    seriesList?.remove(at: idx)
                }
                idx += 1
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindtoMain" {
            let destinationViewController = segue.destination as? ViewController
            destinationViewController?.cardList = cardList!
            destinationViewController?.seriesList = seriesList!
        }
    }
    
}
