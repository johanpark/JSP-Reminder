const ClockTimer =document.querySelector(".js-clock");
const ClockTitle = ClockTimer.querySelector("h1");

function getTime() {
    const Time = new Date();
    const min = Time.getMinutes();
    const hours = Time.getHours();
    const sec = Time.getSeconds();
    ClockTitle.innerText =`${hours <10 ? `0${hours}` : hours}:${min <10 ? `0${min}` : min}:${sec <10 ? `0${sec}` : sec}`;

}
function init()
{
    getTime();
    setInterval(getTime, 1000);
}
init();