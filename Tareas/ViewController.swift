//
//  ViewController.swift
//  Tareas
//
//  Created by Josimar on 4/11/19.
//  Copyright © 2019 Josimar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.lightGray
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = UITableViewCell()
        let tarea = tareas[indexPath.row]
        cell.textLabel?.text = tarea.nombre
        if tarea.final < 13.0 {
            cell.backgroundColor = UIColor.red
        } else {
            cell.backgroundColor = UIColor.green
        }
    }
    

    @IBOutlet weak var tableView: UITableView!
    var tareas:[Tarea] = []
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tarea = tareas[indexPath.row]
        cell.textLabel?.text = tarea.nombre
        if tarea.final < 13.0 {
            cell.backgroundColor = UIColor.red
        } else {
            cell.backgroundColor = UIColor.green
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        indexSeleccionado = indexPath.row
        let tarea = tareas[indexPath.row]
        performSegue(withIdentifier: "tareaSeleccionadaSegue", sender: tarea)
    }
    
    
    @IBAction func agregarTarea(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    func obtenerTareas() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tareas = try context.fetch(Tarea.fetchRequest()) as! [Tarea]
        } catch {
            print("HA OCURRIDO UN ERROR.")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerTareas()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let tarea = tareas[indexPath.row]
            let delegate  = (UIApplication.shared.delegate as! AppDelegate)
            let context = delegate.persistentContainer.viewContext
            context.delete(tarea)
            delegate.saveContext()
            viewWillAppear(true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "agregarSegue" {
//            let siguienteVC = segue.destination as! CrearTareaViewController
//            siguienteVC.anteriorVC = self	
//        }
        if segue.identifier == "tareaSeleccionadaSegue" {
            let siguienteVC = segue.destination as! TareaCompletadaViewController
            siguienteVC.tarea = sender as? Tarea
//            siguienteVC.anteriorVC = self
        }
    }
}

