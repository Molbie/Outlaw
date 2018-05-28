import XCTest
@testable import OutlawTests


XCTMain([
    testCase(ArrayTests.allTests),
    testCase(BoolTests.allTests),
    testCase(CharacterTests.allTests),
    testCase(DateTests.allTests),
    testCase(DeserializableTests.allTests),
    testCase(DeserializableWithContextTests.allTests),
    testCase(DictionaryTests.allTests),
    testCase(DoubleTests.allTests),
    testCase(EnumTests.allTests),
    testCase(FloatTests.allTests),
    testCase(IntTests.allTests),
    testCase(Int8Tests.allTests),
    testCase(Int16Tests.allTests),
    testCase(Int32Tests.allTests),
    testCase(Int64Tests.allTests),
    testCase(SerializableTests.allTests),
    testCase(SerializableWithContextTests.allTests),
    testCase(SetTests.allTests),
    testCase(StringTests.allTests),
    testCase(UIntTests.allTests),
    testCase(UInt8Tests.allTests),
    testCase(UInt16Tests.allTests),
    testCase(UInt32Tests.allTests),
    testCase(UInt64Tests.allTests),
    testCase(UpdatableTests.allTests),
    testCase(UpdatableWithContextTests.allTests),
    testCase(URLTests.allTests),
    testCase(ValueWithContextTests.allTests)
])
