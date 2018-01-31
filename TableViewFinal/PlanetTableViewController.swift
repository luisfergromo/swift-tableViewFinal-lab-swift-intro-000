//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    var planetCellIdentifier:String = "PlanetCell"
    var planets:[Planet] = []
    func generatePlanetInfo(){
        let earthFacts: [String] = [
            "Earth is the only planet not named after a god.",
            "Earth has a powerful magnetic field.",
            "Earth was once believed to be the center of the universe."
        ]
        let earth = Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts: earthFacts)
        let marsFacts:[String] = [
            "Mars and Earth have approximately the same landmass.",
            "Mars is home to the tallest mountain in the solar system.",
            "Pieces of Mars have fallen to Earth."
        ]
        let mars = Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687.0, facts: marsFacts)
        planets = [earth,mars]
    }
    override func viewDidLoad() {
        generatePlanetInfo()
        super.viewDidLoad()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "ShowFacts" { return }
        if let destination = segue.destination as?  FactTableViewController, let indexPath = tableView.indexPathForSelectedRow{
            destination.planet = planets[indexPath.row]
        }
    }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as! PlanetTableViewCell

            let planet = planets[indexPath.row]
            cell.planetNameLabel.text = planet.name
            cell.numberOfMoonsLabel.text = "\(planet.numberOfMoons)"
            cell.numberOfDaysFullOrbitLabel.text = "\(planet.fullOrbit)"
            cell.numberOfFacts.text = "\(planet.facts.count)"

            return cell
        }
}
