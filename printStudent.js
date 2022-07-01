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

// id를 매개변수로 받아 정보를 출력하는 함수 printStudent를 만드세요.

let printStudent = (id) => {
    if ((Object.keys(students).indexOf(id) > -1)){
        console.log ("이름 : " + students[id].name + "\n나이 : " + students[id].age + "\n연락처 : " + students[id].contact);
    } else {
        return '일치하는 학생이 없습니다.'
    }
};
