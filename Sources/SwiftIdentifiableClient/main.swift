import SwiftID

@StringIdentifiable(String.self)
struct StringIDPerson {
    var name: String
}

let stringIDPerson: StringIDPerson = .init(name: "", id: "")

@IntegerIdentifiable(Int.self)
public struct IngerIDPerson {
    var name: String
}

let ingerIDPerson: IngerIDPerson = .init(name: "", id: 0)
