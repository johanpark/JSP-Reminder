const API_KEY = "c5d8aa1b760e0b50376a9bfc3b0e3383";
const COORDS = 'coords';
const Weather = document.querySelector(".js-weather");
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

function SaveCoords(CoordsObj){
    localStorage.setItem(COORDS, JSON.stringify(CoordsObj));
}

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