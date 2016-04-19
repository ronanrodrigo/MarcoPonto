//
//  SavePunchUsecaseFactory.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class SavePunchUsecaseFactory {
    static func make(presenter presenter: SavePunchPresenter) -> SavePunchUsecase {
        return SavePunchUsecase(gateway: PunchGatewayCoreDataFactory.make(), presenter: presenter)
    }
}
