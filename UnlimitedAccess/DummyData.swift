//
// Created by pavels.garklavs on 03/03/2022.
//

import Foundation

final class DummyData {

    static let shared = DummyData()

    var footerData = ["Lorem ipsum, lorem ipsum", "Lorem ipsum", "Lorem"]

    private init() {}
}
