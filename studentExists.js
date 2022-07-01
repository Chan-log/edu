// id를 매개변수로 받아 해당  id를 키로가지는 학생이 있는가에 대한 여부를 반환하는 함수 studentExists를 만드세요.

let studentExists = (id) =>  Object.keys(students).indexOf(id) > -1;

// let studentExists = (id) => {
//     if ((Object.keys(students).indexOf(id) > -1)){
//         return true;
//     } else {
//         return false;
//     }
// }

// console.log(studentExists('dsaA'));
