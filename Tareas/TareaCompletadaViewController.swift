//
//  TareaCompletadaViewController.swift
//  Tareas
//
//  Created by Josimar on 4/12/19.
//  Copyright © 2019 Josimar. All rights reserved.
//

import UIKit

class TareaCompletadaViewController: UIViewController {


    
    var tarea : Tarea? = nil

    @IBOutlet weak var tareaLabel: UILabel!
    @IBOutlet weak var txtTeoria1: UILabel!
    @IBOutlet weak var txtTeoria2: UILabel!
    @IBOutlet weak var txtTeoria3: UILabel!
    @IBOutlet weak var txtPromTeoria: UILabel!
    @IBOutlet weak var txtLab1: UILabel!
    @IBOutlet weak var txtLab2: UILabel!
    @IBOutlet weak var txtLab3: UILabel!
    @IBOutlet weak var txtPromLab: UILabel!
    @IBOutlet weak var txtFinal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if tarea!.importante {
            tareaLabel.text = "🙀\(tarea!.nombre!)"
        } else {
            tareaLabel.text = tarea!.nombre!
        }
        txtTeoria1.text = String(tarea!.teoria1)
        txtTeoria2.text = String(tarea!.teoria2)
        txtTeoria3.text = String(tarea!.teoria3)
        txtLab1.text = String(tarea!.lab1)
        txtLab2.text = String(tarea!.lab2)
        txtLab3.text = String(tarea!.lab3)
        txtPromLab.text = String(tarea!.promLab)
        txtPromTeoria.text = String(tarea!.promTeoria)
        txtFinal.text = String(tarea!.final)
    }
    
    @IBAction func completarTarea(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(tarea!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
}
