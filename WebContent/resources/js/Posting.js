const editorForm = document.querySelector('#editor-form');
const titleInput = document.querySelector('#editor-title-input');
const contentInput = document.querySelector('#editor-content-input');
const BOARDLIST_LS = 'boardLists';
let boardListObj = [];
const USER_LS = "currentUser";
let date = new Date();
const newId = boardListObj.length + 1;
/*const author = "John";*/
/*포스팅 목록 저장*/
function SaveList(){
    localStorage.setItem(BOARDLIST_LS, JSON.stringify(boardListObj));
}

function assignIndex() {
    const lists = JSON.parse(localStorage.getItem(BOARDLIST_LS));
    if (!lists) {
        nums = 1;
    } else {
        nums = parseInt(lists[lists.length - 1].num) + 1;
    }
}

function onEditSubmit(e)
{
    
    e.preventDefault();
 
    const title = titleInput.value;
    const content = contentInput.value;
     
    const lists = JSON.parse(localStorage.getItem(BOARDLIST_LS));
    if (!lists) {
    const objArr = [];
        objArr.push({
        num: `${nums++}`,
        title: `${title}`,
        author: `${author}`,
        date: `${date.getFullYear()}.${date.getMonth() +
        1}.${date.getDate()}.`,

        content: `${content}`
    });
     
    localStorage.setItem(BOARDLIST_LS, JSON.stringify(objArr));
    } else {
    lists.push({
    num: `${nums++}`,
    title: `${title}`,
    author: `${author}`,
    date: `${date.getFullYear()}.${date.getMonth() +
    1}.${date.getDate()}.`,
    content: `${content}`
    });
     
    localStorage.setItem(BOARDLIST_LS, JSON.stringify(lists));
    }

    titleInput.value = '';
    contentInput.value = '';
}


assignIndex();   
editorForm.addEventListener("submit", onEditSubmit);
