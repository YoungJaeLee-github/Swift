<pre>
  let someCharacter: Character = "A"
  let someInt: Int = 5
  let newCharacter: Character = Character(UnicodeScalar(someCharacter.asciiValue! + UInt8(someInt)))
  if let ascii = someCharacter.asciiValue {
    let someInt: Int = 5
    let newCharacter: Character = Character(UnicodeScalar(ascii + UInt8(someInt)))
    // let newCharacter: Character = Character(UnicodeScalar(ascii + someInt)) 
    // Cannot convert value of type 'Int' to expected argument type 'UInt8' 이기 때문에
    // 위와 같이 UInt8로 캐스팅 해주어야 함(아스키 코드 값에는 부호 정수가 없음)
    print(someCharacter, newCharacter)
}
</pre>
