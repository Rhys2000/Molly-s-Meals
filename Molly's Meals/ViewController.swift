//
//  ViewController.swift
//  Molly's Meals
//
//  Created by Rhys Julian-Jones on 7/11/22.
//

import UIKit
import Foundation

struct Restaurant: Codable {
    var restaurantName: String = ""
    var restaurantStreetAddress: String = ""
    var restaurantCity: String = ""
    var restaurantState: String = ""
    var restaurantZipcode: Int = 0
}

var listOfRestaurants = [Restaurant]()

class ViewController: UIViewController {

    @IBOutlet weak var restaurantNameTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let data = UserDefaults.standard.data(forKey: "restaurantList") {
            do {
                let decoder = JSONDecoder()
                listOfRestaurants = try decoder.decode([Restaurant].self, from: data)
            } catch {
                print("Unable to decode Restaurants")
            }
        }
        var temp = ""
        for restaurant in listOfRestaurants {
            temp += restaurant.restaurantName + ", "
        }
        if(temp == "") {
            textView.text = "Restaurant Names"
        } else {
            textView.text = temp
        }
    }

    @IBAction func setDataButton(_ sender: Any) {
        let name = restaurantNameTextField.text
        var tempRestaurant = Restaurant()
        tempRestaurant.restaurantName = name!
        listOfRestaurants.append(tempRestaurant)
        restaurantNameTextField.text = ""
        textView.text = ""
        for restaurant in listOfRestaurants {
            textView.text += restaurant.restaurantName + ", "
        }
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(listOfRestaurants)
            UserDefaults.standard.set(data, forKey: "restaurantList")
        } catch {
            print("Unable to encode the array")
        }
    }
    
}
