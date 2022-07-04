const startButton = document.getElementById('startButton');
const ground = document.getElementById('ground');
// 요소.classList.add(x) 클래스 추가한다
// 요소.classList.remove(x) 클래스 제거한다
// 요소.classList.contains(x) 클래스 포함하는가 여부를 반환
startButton.addEventListener('click', () => {
    startButton.classList.remove('visible');
    ground.classList.add('visible');
});