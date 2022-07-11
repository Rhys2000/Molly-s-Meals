//
//  ViewController.swift
//  Molly's Meals
//
//  Created by Rhys Julian-Jones on 7/11/22.
//

import UIKit

struct Restaurant {
    var restaurantName = ""
}

var listOfRestaurants = [Restaurant]()

class ViewController: UIViewController {

    @IBOutlet weak var restaurantNameTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func setDataButton(_ sender: Any) {
        let name = restaurantNameTextField.text
        var tempRestaurant = Restaurant()
        tempRestaurant.restaurantName = name!
        listOfRestaurants.append(tempRestaurant)
        restaurantNameTextField.text = ""
        for restauant in listOfRestaurants {
            textView.text += restauant.restaurantName
        }
    }
    
}

