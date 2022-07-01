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

let addStudents = (id, name, age, contact) => {
    students[id] = {
        name : name,
        age : age,
        contact : contact
    }
}
