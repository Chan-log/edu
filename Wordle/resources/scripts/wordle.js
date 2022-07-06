const words = [ 'about', 'above', 'actor', 'adult', 'alarm', 'album', 'baker', 'beach', 'bench', 'cable', 'chair', 'chart', 'dance', 'death', 'drame', 'dream' ];

let word;

const startButton = document.getElementById('startButton');
const ground = document.getElementById('ground');
// 요소.classList.add(x) 클래스 추가한다
// 요소.classList.remove(x) 클래스 제거한다
// 요소.classList.contains(x) 클래스 포함하는가 여부를 반환
startButton.addEventListener('click', () => {
    // alert( startButton.dataset['message']);
    // html 태그 내 'data-가나다' 라고 되어 있는 속성 값에는 .dataset['가나다']로 접근 가능

    // startButton.dataset['key'] = 'value'; 이런식으로 추가도 가능

    startButton.classList.remove('visible');
    ground.classList.add('visible');
    // ceil 올림 floor 내림 round 반올림
    word = words[Math.floor(words.length * Math.random())];
    let wordSplit = word.split('');
    console.log(word + wordSplit);
});

const numberContainer = document.getElementById('numberContainer');
const numbers = numberContainer.querySelectorAll(':scope > .number');

let keyNumber = 0;
let row = 1;
document.body.querySelectorAll('[data-key]').forEach(x => {
    x.addEventListener('click', ()=>{
        if (x.dataset['key'] === '_DELETE'){
            if(keyNumber <= 0){
                return;
            }
            keyNumber = keyNumber - 1;
            numbers[keyNumber].innerText = '';
        } else if (x.dataset['key'] === '_ENTER'){
            console.log('Enter');
            let tanngo = '';

            for (let i = 0; i < row*5; i++){
                tanngo = tanngo + numbers[i].innerText;
                if (wordSplit[i] === numbers[i].innerText){
                }
                console.log(tanngo)
            }
            if (word === tanngo.toLowerCase()){
                console.log('정답')
            } else {
                console.log('아니다')
            }
        } else {
            if (row*5-1 > keyNumber){
                keyNumber++;
                numbers[keyNumber].innerText = x.dataset['key'];
            } else {
                console.log(row + '줄 끝남')
                row++;
            }
        }
    });
});
