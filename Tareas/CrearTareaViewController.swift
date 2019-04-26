//
//  CrearTareaViewController.swift
//  Tareas
//
//  Created by Josimar on 4/11/19.
//  Copyright © 2019 Josimar. All rights reserved.
//

import UIKit

class CrearTareaViewController: UIViewController {
    
    
    @IBOutlet weak var txtNombreTarea: UITextField!
    @IBOutlet weak var txtTeoria1: UITextField!
    @IBOutlet weak var txtTeoria2: UITextField!
    @IBOutlet weak var txtTeoria3: UITextField!
    @IBOutlet weak var txtLab1: UITextField!
    @IBOutlet weak var txtLab2: UITextField!
    @IBOutlet weak var txtLab3: UITextField!
    
    
//    var anteriorVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func toDouble(from textField: UITextField) -> Double {
        guard let text = textField.text, let number = Double(text) else {
            return 0
        }
        return number
    }

    @IBAction func agregar(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let tarea = Tarea(context: context
        )
        tarea.nombre = txtNombreTarea.text!
        tarea.teoria1 = toDouble(from: txtTeoria1)
        tarea.teoria2 = toDouble(from: txtTeoria2)
        tarea.teoria3 = toDouble(from: txtTeoria3)
        tarea.lab1 = toDouble(from: txtLab1)
        tarea.lab2 = toDouble(from: txtLab2)
        tarea.lab3 = toDouble(from: txtLab3)
        tarea.promTeoria = (tarea.teoria1 + tarea.teoria2 + tarea.teoria3) / 3
        tarea.promLab = (tarea.lab1 + tarea.lab2 + tarea.lab3) / 3
        tarea.final = (tarea.promTeoria + tarea.promLab) / 2
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
}
