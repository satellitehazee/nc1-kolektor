//
//  ViewController.swift
//  Kolektor
//
//  Created by Hocky on 28/04/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableSeries: UITableView!
    @IBAction func buttonAddCard(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoAddCard", sender: self)
    }
    
    var cardList: [Card] = [
        Card(series: "Pokemon", id: "SWSH-001", name: "Pikachu", rarity: "C", price: "100", wish: "9"),
        Card(series: "Pokemon", id: "SWSH-002", name: "Bulbasaur", rarity: "R", price: "500", wish: "5"),
        Card(series: "Pokemon", id: "SWSH-003", name: "Charmander", rarity: "R", price: "500", wish: "6"),
        Card(series: "Pokemon", id: "SWSH-004", name: "Squirtle", rarity: "R", price: "500", wish: "7"),
        Card(series: "Yu-Gi-Oh!", id: "YGO-001", name: "Kuriboh", rarity: "U", price: "200", wish: "4"),
        Card(series: "Yu-Gi-Oh!", id: "YGO-002", name: "Exodia", rarity: "R", price: "999", wish: "8")
    ]
    var seriesList: [Series] = [
        Series(name: "Pokemon"),
        Series(name: "Yu-Gi-Oh!")
    ]
    
    var pickedCardList: [Card]?
    var pickedSeriesName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSeries.delegate = self
        tableSeries.dataSource = self
        navigationItem.hidesBackButton = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = seriesList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        pickedSeriesName = seriesList[indexPath.row].name
        performSegue(withIdentifier: "gotoList", sender: self)
        print(pickedSeriesName!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoList" {
            let destinationViewController = segue.destination as? ListViewController
            destinationViewController?.cardList = self.cardList
            destinationViewController?.seriesList = self.seriesList
            destinationViewController?.seriesName = self.pickedSeriesName
        }
        else if segue.identifier == "gotoAddCard"{
            let destinationViewController = segue.destination as? AddCardViewController
            destinationViewController?.cardList = self.cardList
            destinationViewController?.seriesList = self.seriesList
        }
    }
}


