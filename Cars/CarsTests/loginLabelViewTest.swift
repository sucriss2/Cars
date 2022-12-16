//
//  loginLabelViewTest.swift
//  CarsTests
//
//  Created by Suh on 28/11/22.
//

import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import Cars

class LabeledTextFieldViewSpec: QuickSpec {
    override func spec() {
        describe("the 'UI'      ") {
            it("should have the expected look and feel") {
                let frame = CGRect(x: 0, y: 0, width: 250, height: 80)
                let view = LabeledTextField(title: "Nome", placeholder: "Seu nome aqui")
                view.frame = frame
//                expect(view) == snapshot("ViewControllerScreen")
                expect(view) == snapshot("LabeledTextFieldViewSpec")
            }
        }
    }
}
