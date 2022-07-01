// students 오브젝트가 가지고 있는 모든 쌍을 출력하는 함수 printAllStudents 를 만드세요.

let printAllStudents = () => {
    for (let i = 0; Object.keys(students).length > i; i++){
        let id = Object.keys(students)[i];
        printStudent(id);
        if (Object.keys(students).length > i+1){
            console.log("--------------------------");
        }
    } 
}
printAllStudents();
