let countries = {
    au: {
        area : 7688000,
        name : '호주',
        population: 2569,
    },
    de: {
        area: 357588,
        name : '독일',
        population: 8324,
    },
    fr: {
        area: 543940,
        name: '프랑스',
        population: 6739,
    },
    gb: {
        area: 243610,
        name: '영국',
        population: 6722,
    },
    jp: {
        area: 377975,
        name: '일본',
        population: 12580,
    },
    ko: {
        area: 100210,
        name: '한국',
        population: 5178
    },
    us: {
        area: 9834000,
        name: '미국',
        population: 32950,
    },
}

// 매개변수로 주어진 문자열 이름과 일치하는 국가의 코드를 반환하는 함수 nameToCode 을 만드세요. 정의 되지 않는 코드가 입력될 경우 '존재하지 않는 이름'반환

let nameToCode = (a) => {
    for(let i = 0; Object.keys(countries).length > i ; i++){
        let code = Object.keys(countries)[i];
        if (countries[code].name == a){
            return code;
        }
    }
    return "존재하지 않는 이름";
}
