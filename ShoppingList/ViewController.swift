//
//  ViewController.swift
//  ShoppingList
//
//  Created by Juliana de Carvalho on 2020-10-28.
//  Copyright © 2020 Juliana de Carvalho. All rights reserved.
//

import UIKit

struct Products {
    var name: String
    var quantity: Int
}

class ViewController: UIViewController {
 
    //array of Products
    var items = [Products]()
    
    @IBOutlet weak var shoppingListName: UILabel!
    
    @IBAction func shoppingListNameInput(_ sender: UITextField) {
        //passing the shopping list name that the user typed to the label reserved to display it
        shoppingListName.text = sender.text
        sender.text = ""
    }
    
    @IBAction func Item1EditingDidBegin(_ sender: UITextField){
      //the shopping list input is not required then if the user
      //start to enter the item 1 info and did not choose the list name it is going to have a default list name
      if (shoppingListName.text == ""){
          shoppingListName.text = "Shopping List"
      }
    }
    
    @IBAction func changeTextFieldBorder(_ sender:
        UITextField) {
        //changing the border from the textField once the user types something
        sender.borderStyle = UITextField.BorderStyle(rawValue: 0)!
    }
    
    //quantity labels
    @IBOutlet weak var quantityItem1: UILabel!
    @IBOutlet weak var quantityItem2: UILabel!
    @IBOutlet weak var quantityItem3: UILabel!
    @IBOutlet weak var quantityItem4: UILabel!
    @IBOutlet weak var quantityItem5: UILabel!
    @IBOutlet weak var quantityItem6: UILabel!
   
    //when stepper 1 have a value changed
    @IBAction func qtyIem1Stepper(_ sender: UIStepper) {
        //passing the value to the quantity label
        quantityItem1.text = Int(sender.value).description
    }
    //when stepper 2 have a value changed
    @IBAction func qtyIem2Stepper(_ sender: UIStepper) {
        quantityItem2.text = Int(sender.value).description
    }
    //when stepper 3 have a value changed
    @IBAction func qtyItem3Stepper(_ sender: UIStepper) {
        quantityItem3.text = Int(sender.value).description
    }
    //when stepper 4 have a value changed
    @IBAction func qtyItem4Stepper(_ sender: UIStepper) {
        quantityItem4.text = Int(sender.value).description
    }
    //when stepper 5 have a value changed
    @IBAction func qtyItem5Stepper(_ sender: UIStepper) {
        quantityItem5.text = Int(sender.value).description
    }
    //when stepper 6 have a value changed
    @IBAction func qtyItem6Stepper(_ sender: UIStepper) {
        quantityItem6.text = Int(sender.value).description
    }
    @IBAction func saveButton(_ sender: UIButton) {
        //saving the info from the input Item 1 and the correspondent quantity value in an array
        var item = Products(name: item1Text.text!, quantity: Int(quantityItem1.text!)!)
        items += [item]
        item = Products(name: item2Text.text!, quantity: Int(quantityItem2.text!)!)
        items += [item]
        item = Products(name: item3Text.text!, quantity: Int(quantityItem3.text!)!)
        items += [item]
        item = Products(name: item4Text.text!, quantity: Int(quantityItem4.text!)!)
        items += [item]
        item = Products(name: item5Text.text!, quantity: Int(quantityItem5.text!)!)
        items += [item]
        item = Products(name: item6Text.text!, quantity: Int(quantityItem6.text!)!)
        items += [item]
        
        //Saving the Shopping list data in Local Storage (user preferences)
        //Store key-value pairs persistently across launches of your app.
        let defaults = UserDefaults.standard
        //passing the array with all items/quantity and for the key passing the name of the list
        defaults.set(items, forKey: shoppingListName.text!)
        //
        //let products = defaults.array(forKey: shoppingListName.text!)
    }
    //referencing all steppers to use it in the cancel button
    @IBOutlet weak var stepper1Value: UIStepper!
    @IBOutlet weak var stepper2Value: UIStepper!
    @IBOutlet weak var stepper3Value: UIStepper!
    @IBOutlet weak var stepper4Value: UIStepper!
    @IBOutlet weak var stepper5Value: UIStepper!
    @IBOutlet weak var stepper6Value: UIStepper!
    //referencing all textField to use it in the cancel button
    @IBOutlet weak var item1Text: UITextField!
    @IBOutlet weak var item2Text: UITextField!
    @IBOutlet weak var item3Text: UITextField!
    @IBOutlet weak var item4Text: UITextField!
    @IBOutlet weak var item5Text: UITextField!
    @IBOutlet weak var item6Text: UITextField!
    
    @IBAction func cancelButton(_ sender: UIButton) {
        let resetQty = "0"
        let valueSteppers = Double(resetQty)
        //cleaning the shopping list name
        shoppingListName.text = ""
        //reseting all quantity labels to zero
        quantityItem1.text = resetQty
        quantityItem2.text = resetQty
        quantityItem3.text = resetQty
        quantityItem4.text = resetQty
        quantityItem5.text = resetQty
        quantityItem6.text = resetQty
        //reseting all steppers value to zero
        stepper1Value.value = valueSteppers!
        stepper2Value.value = valueSteppers!
        stepper3Value.value = valueSteppers!
        stepper4Value.value = valueSteppers!
        stepper5Value.value = valueSteppers!
        stepper6Value.value = valueSteppers!
        //cleaning the items texts and putting the border back with white background
        item1Text.text = ""
        item1Text.borderStyle = UITextField.BorderStyle(rawValue: 4)!
        item1Text.backgroundColor = UIColor.white
        
        item2Text.text = ""
        item2Text.borderStyle = UITextField.BorderStyle(rawValue: 4)!
        item2Text.backgroundColor = UIColor.white
        
        item3Text.text = ""
        item3Text.borderStyle = UITextField.BorderStyle(rawValue: 4)!
        item3Text.backgroundColor = UIColor.white
        
        item4Text.text = ""
        item4Text.borderStyle = UITextField.BorderStyle(rawValue: 4)!
        item4Text.backgroundColor = UIColor.white
        
        item5Text.text = ""
        item5Text.borderStyle = UITextField.BorderStyle(rawValue: 4)!
        item5Text.backgroundColor = UIColor.white
        
        item6Text.text = ""
        item6Text.borderStyle = UITextField.BorderStyle(rawValue: 4)!
        item6Text.backgroundColor = UIColor.white
    }
    
    @IBOutlet weak var viewItem1: UIView!
    @IBOutlet weak var viewItem2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adding a tap gesture to the main view.
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        //adding a swipe gesture to left and right direction
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        viewItem1.addGestureRecognizer(leftSwipe)
        viewItem1.addGestureRecognizer(rightSwipe)
        //viewItem2.addGestureRecognizer(leftSwipe)
        //viewItem2.addGestureRecognizer(rightSwipe)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            //getting the current position, so after swiping it can go back to the position it was before
            let origPosition = CGPoint(x: gesture.view!.frame.origin.x , y: gesture.view!.frame.origin.y)
            
            switch swipeGesture.direction {
            case .right:
                print("Swiped right")//right direction
                //saving different positions to move the view
                let position1 = CGPoint(x: gesture.view!.frame.origin.x + 215, y: gesture.view!.frame.origin.y)
                let position2 = CGPoint(x: gesture.view!.frame.origin.x + 415, y: gesture.view!.frame.origin.y)
                //seting to the position defined in the var position1
                gesture.view!.frame = CGRect(x: position1.x, y: position1.y, width:gesture.view!.frame.size.width,height:gesture.view!.frame.size.height)
                //waiting 0.1 seconds before moving again to the position defined in the var position2
                var seconds = 0.1
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    gesture.view!.frame = CGRect(x: position2.x, y: position2.y, width: gesture.view!.frame.size.width, height: gesture.view!.frame.size.height)
                 }
                //waiting more 0.5 seconds moving to the original position again
                seconds = 0.5
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    gesture.view!.frame = CGRect(x: origPosition.x, y: origPosition.y, width: gesture.view!.frame.size.width, height: gesture.view!.frame.size.height)
                       }
 
            case .left:
                print("Swiped left")
                //saving different positions to move the view
                let position1 = CGPoint(x: gesture.view!.frame.origin.x - 215, y: gesture.view!.frame.origin.y)
                let position2 = CGPoint(x: gesture.view!.frame.origin.x - 415, y: gesture.view!.frame.origin.y)
                       
                gesture.view!.frame = CGRect(x: position1.x, y: position1.y, width: gesture.view!.frame.size.width, height: gesture.view!.frame.size.height)
                       
                var seconds = 0.1
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    gesture.view!.frame = CGRect(x: position2.x, y: position2.y, width: gesture.view!.frame.size.width, height: gesture.view!.frame.size.height)
                }
                
                seconds = 0.5
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    gesture.view!.frame = CGRect(x: origPosition.x, y: origPosition.y, width: gesture.view!.frame.size.width, height: gesture.view!.frame.size.height)
                }
      
            default:
                break
            }
        }
        
        
    
    }


}

