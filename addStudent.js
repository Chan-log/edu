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

// id, name, age, contact 총 네 개를 전달 받아 위 'students' 오브엑트에 추가하는 함수 addStudent를 만드세요.
// students 오브젝트에 학생을 추가할 경우 id값을 키로 사용하고 그 값은 name age contact 키중 세게를 매개변수 값과 쌍이 되도록 가진다. 이미 id가 있을 경우 수정

let addStudent = (id, name, age, contact) => {
    let data = { id : id, name : name, age : age, contact : contact };
    if ((Object.keys(students).indexOf(id) > -1)){
        delete students[id];
        students[id] = (data);
    } else {
        students[id] = (data);
    }
    return students;
}
