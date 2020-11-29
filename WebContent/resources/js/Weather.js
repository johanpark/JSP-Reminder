const API_KEY = "c5d8aa1b760e0b50376a9bfc3b0e3383";
const COORDS = 'coords';
const Weather = document.querySelector(".js-weather");
/*날씨 정보를 openapi를 사용해서 JSON으로 얻어와 그 정보 출력*/
function GetWeather(lat , lon){
    fetch(
        `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`
    ).then(function(respone){
        return respone.json();
    })
    .then(function(json){
        const Temperature = json.main.temp;
        const Place = json.name;
        Weather.innerText =`${Temperature} @ ${Place}`;
    })
}
/*위도 경도 저장*/
function SaveCoords(CoordsObj){
    localStorage.setItem(COORDS, JSON.stringify(CoordsObj));
}
/*위도 경도를 저장 후 구조체로 저장*/
function HandleGeoSucces(position){
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;
    const CoordsObj = {
        latitude,
        longitude
    };
    SaveCoords(CoordsObj);
    GetWeather(latitude, longitude);
};
function HandleGeoError(){
    console.log("Can't");
}
/*현재 위치 물어봄*/
function askForCoords(){
    navigator.geolocation.getCurrentPosition(HandleGeoSucces, HandleGeoError);
}
function LoadCoords(){
    const LoadedCoords = localStorage.getItem(COORDS);
    if(LoadedCoords === null){
        askForCoords();
    }else{
            const ParseCoords = JSON.parse(LoadedCoords);
            GetWeather(ParseCoords.latitude, ParseCoords.longitude);
    }
}

function init(){
    LoadCoords();
}
init();