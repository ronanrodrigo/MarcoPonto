//
//  ListPunchsUsecase.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class ListPunchsUsecase {
    private var gateway: PunchGateway
    private var presenter: ListPunchsPresenter
    
    init(gateway: PunchGateway, presenter: ListPunchsPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func list() {
        let punchs = self.gateway.list()
        presenter.list(punchs)
    }
}
