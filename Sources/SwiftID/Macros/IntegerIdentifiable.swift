@attached(member, names: named(ID), named(id))
@attached(extension, conformances: Identifiable)
public macro IntegerIdentifiable<T: BinaryInteger>(_: T.Type) = #externalMacro(module: "SwiftIdentifiableMacros", type: "IntegerIdentifiableMacro")
