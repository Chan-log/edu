let arr = ['a', 'b', 'c', 'd', 'e'];
let arr2 = [1,2,3,4];

// Array의 모든 값이 정수라면 평균 값을 구해준다.
Array.prototype.average = function (){
    if(this.every((x) => typeof(x) === "number")){
        return this.reduce((p, c) => p + c) / this.length;
    } else {
        return -1;
    };
};

// arr.average(); return -1
// arr2.average(); return 2.5
