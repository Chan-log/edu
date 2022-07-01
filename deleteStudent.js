let students = {
    A : {
        name: '김학생',
        age: 20,
        contact : '010-0000-0000'
    },
    B : {
        name : '박학생',
        age: 30,
        contact : '010-3333-34444'
    }
};

// id를 매개변수로 받아 학생을 삭제하는 함수 deleteStudent를 만드세요. 학생 삭제 성공 true 실패 false

let deleteStudent = (id) => {
    if ((Object.keys(students).indexOf(id) > -1)){
        delete students[id];
        return true;
    } else {
        return false;
    }
}
