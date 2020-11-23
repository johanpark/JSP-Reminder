const Body = document.querySelector("body");
const IMG_NUM = 3;
function PaintImg(ImgNumber){
    const BackImage = new Image();
    BackImage.src = `/Reminder/resources/images/Image_${ImgNumber + 1}.jpg`;
    BackImage.classList.add("bgimage");
    Body.prepend(BackImage);
}

function GetRandom(){
    const Num = Math.floor(Math.random() * IMG_NUM);
    return Num;
}

function init()
{
     const RandomNum = GetRandom();
     PaintImg(RandomNum);
}
init();