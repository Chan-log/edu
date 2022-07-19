let arr = ['a', 'b', 'c', 'd', 'e'];
let arr2 = [1,2,3,4];

Array.prototype.average = function (){
    if(this.every((x) => typeof(x) === "number")){
        return this.reduce((p, c) => p + c) / this.length;
    } else {
        return -1;
    };
};

