let 소수 = function(a){
	for(let i=2; i < a; i++){
		if (a % i === 0){
			return false;
		}
	}
	return true;
}
console.log(소수(8))
