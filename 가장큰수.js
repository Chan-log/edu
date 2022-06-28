let mnums1 = [107, 36, 1198, 19]
let mnums2 = [960, 388, 3190, 55]
let getMax = (a) => {
    let maxNum = 0;
    for (i = 0; i < a.length; i++) {
        if(maxNum < a[i]){
            maxNum = a[i];
        }
    }
    return maxNum;
}
