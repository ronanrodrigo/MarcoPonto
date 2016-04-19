//
//  SavePunchUsecase.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class SavePunchUsecase {
    var gateway: PunchGateway
    var presenter: SavePunchPresenter
    
    init(gateway: PunchGateway, presenter: SavePunchPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func save(punch: Punch) {
        if punch.isNewPunch() {
            gateway.create(punch)
        } else {
            gateway.update(punch)
        }
        
        self.presenter.didSavePunch()
    }
}