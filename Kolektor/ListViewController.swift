//
//  ListViewController.swift
//  Kolektor
//
//  Created by Hocky on 28/04/22.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet weak var labelSeries: UILabel!
    @IBOutlet weak var tableCard: UITableView!
    @IBAction func buttonAddCard(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoAddCard", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        migrateCardList()
        labelSeries.text = seriesName
        tableCard.delegate = self
        tableCard.dataSource = self
    }
    
    var cardList: [Card]?
    var seriesList: [Series]?
    var seriesCardList: [Card] = []
    var seriesName: String?
    var pickedCard: Card?
    
    func migrateCardList(){
        for x in cardList!{
            if x.series == seriesName{
                seriesCardList.append(x)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seriesCardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = seriesCardList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        pickedCard = seriesCardList[indexPath.row]
        performSegue(withIdentifier: "gotoDetails", sender: self)
        print(pickedCard!.name)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoDetails" {
            let destinationViewController = segue.destination as? DetailsViewController
            destinationViewController?.card = pickedCard!
            destinationViewController?.cardList = cardList!
            destinationViewController?.seriesList = seriesList!
        } else if segue.identifier == "gotoAddCard"{
            let destinationViewController = segue.destination as? AddCardViewController
            destinationViewController?.cardList = cardList!
            destinationViewController?.seriesList = seriesList!
        }
    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return seriesList.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = seriesList[indexPath.row].name
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let series = seriesList[indexPath.row].name
//        performSegue(withIdentifier: "gotoList", sender: self)
//        print(series)
//    }
    
}
