//
//  ViewController.swift
//  Gasolina ou Álcool
//
//  Created by Jefferson Valverde on 14/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var resultadoLegenda: UILabel!
    @IBOutlet weak var precoAlcoolCampo: UITextField!
    @IBOutlet weak var precoGasolinaCampo: UITextField!
    
    
    @IBAction func calcularCombustivel(_ sender: Any) {
        
        if let precoAlcool = precoAlcoolCampo.text {
            if let precoGasolina = precoGasolinaCampo.text {
                
                // Validar valores digitados
                
                let validarCampos = self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                if validarCampos {
                    //calcular melhor combustível
                    self.calcularMelhorPreco(precoalcool: precoAlcool, precoGasoline: precoGasolina)
                }else {
                    resultadoLegenda.text = "Digite os preços para calcular! "
                }
                
            }
        }
        
    }
    
    func  calcularMelhorPreco ( precoalcool: String, precoGasoline: String ) {
        
        // Converter valores texto para numeros
        if let valorAlcool = Double(precoalcool) {
            if let valorGasolina = Double(precoGasoline){
                
                let resultadoPreco = valorAlcool / valorGasolina
                if resultadoPreco >= 0.7 {
                    self.resultadoLegenda.text = "Melhor utilizar Gasolina!"
                }else {
                    self.resultadoLegenda.text = "Melhor utilizar Álcool! "
                }
                
            }
        }
        
    }
    
    
    func validarCampos (precoAlcool: String, precoGasolina: String ) -> Bool {
        
        var camposValidados = true
        
        if precoAlcool.isEmpty {
            camposValidados = false
        }else if precoGasolina.isEmpty{
            camposValidados = false
        }
        
        return camposValidados
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

