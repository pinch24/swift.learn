/**
### 5.1.8 복합 할당 연산자
+=, -=, *=, /=, %=, <<=, >>=, &=, |=, ^=
*/
import Foundation

func exec_5181() {
	
	var a = 4
	let b = 2
	
	a += b
	print(a)
	
	a -= b
	print(a)
	
	a *= b
	print(a)
	
	a /= b
	print(a)
	
	a %= b
	print(a)
	
	a <<= b
	print(a)
	
	a >>= b
	print(a)
	
	a &= b
	print(a)
	
	a |= b
	print(a)
	
	a ^= b
	print(a)
}
