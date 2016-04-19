//
//  ListPunchsUsecaseFactory.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class ListPunchsUsecaseFactory {
    static func make(presenter presenter: ListPunchsPresenter) -> ListPunchsUsecase {
        return ListPunchsUsecase(gateway: PunchGatewayCoreDataFactory.make(), presenter: presenter)
    }
}
