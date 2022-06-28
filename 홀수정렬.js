let nums1 = [1, 2, 3, 4, 5, 6, 7, 8];
let nums2 = [50, 51, 52, 53, 54, 55]

let filterOdds = (a) => {
    let oddNums = [];
    // console.log(nums.length);
    let i;
    for (i = 0; i < a.length; i++) {
        //  console.log(nums[i]);
        if (a[i]%2 === 1){
            oddNums.push(a[i]);
        }
    } return oddNums;
}
let oddNums1 = filterOdds(nums1);
let oddNums2 = filterOdds(nums2);
