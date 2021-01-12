const boardTableBody = document.querySelector('#board-body');
 const contentsContainer = document.querySelector('.contents__container');
 const BOARDLIST_LS = "boardLists";

/*타이틀 클릭 시 게시물 상세 내용 출력*/
/*해당 컬럼에 대한 엘리멘트 추가 적용*/
 function onTitleClick(e) {
    contentsContainer.textContent = '';
    const lists = JSON.parse(localStorage.getItem(BOARDLIST_LS));
    const index = e.target.parentNode.id.replace(/[a-z|-]/gi, '');
     
    const contentsTitles = document.createElement('tr'); 
    contentsTitles.classList.add('contents__titles');
     
    const contentsColumnFirst = document.createElement('td');
    contentsColumnFirst.classList.add('contents__column');
     
    const contentsTitle = document.createElement('td');
    contentsTitle.classList.add('contents__title');
    contentsTitle.textContent = lists[index].title;
     
    // contents__titles > column >author, date, views
    const contentsColumnSecond = document.createElement('td');
    contentsColumnSecond.classList.add('contents__column');
     
    const contentsAuthor = document.createElement('td');
    contentsAuthor.classList.add('contents__author');
    contentsAuthor.textContent = lists[index].author;
     
    const contentsDate = document.createElement('td');
    contentsDate.classList.add('contents__date');
    contentsDate.textContent = lists[index].date;
     
    const contentsViews = document.createElement('td');
    contentsViews.classList.add('contents__views');
    contentsViews.textContent = lists[index].views;
     
    const contentsContent = document.createElement('td');
    contentsContent.classList.add('contents__content');
    contentsContent.textContent = lists[index].content;
     
    contentsColumnFirst.appendChild(contentsTitle);
     
    contentsColumnSecond.appendChild(contentsAuthor);
    contentsColumnSecond.appendChild(contentsDate);
    contentsColumnSecond.appendChild(contentsViews);
     
    contentsTitles.appendChild(contentsColumnFirst);
    contentsTitles.appendChild(contentsColumnSecond);
     
    contentsContainer.appendChild(contentsTitles);
    contentsContainer.appendChild(contentsContent);
    }

/*입력된 포스팅 결과값들을 화면에 적용*/
function showBoardLists() {
    const lists = JSON.parse(localStorage.getItem(BOARDLIST_LS));
    lists.forEach((list, index) => {
    if (index < 5) {
    const tr = document.createElement('tr');
    tr.classList.add('board__content');
     
    const tdNum = document.createElement('td');
    tdNum.classList.add('board__content-column');
    tdNum.textContent = list.num;
     
    const aTitle = document.createElement('a');
    aTitle.href = '#';
    aTitle.id = `link-to-content${index}`;
     
    const tdTitle = document.createElement('td');
    tdTitle.classList.add('board__content-column');
    tdTitle.textContent = list.title;
     
    aTitle.appendChild(tdTitle);
     
    const tdAuthor = document.createElement('td');
    tdAuthor.classList.add('board__content-column');
    tdAuthor.textContent = list.author;
     
    const tdDate = document.createElement('td');
    tdDate.classList.add('board__content-column');
    tdDate.textContent = list.date;
     
    const tdViews = document.createElement('td');
    tdViews.classList.add('board__content-column');
    tdViews.textContent = list.views;
     
    tr.appendChild(tdNum);
    tr.appendChild(aTitle);
    tr.appendChild(tdAuthor);
    tr.appendChild(tdDate);
    tr.appendChild(tdViews);
     
    boardTableBody.appendChild(tr);
    const linkToContent = document.querySelector(
    `#link-to-content${index}`
    );
    linkToContent.addEventListener('click', onTitleClick);
    } else if (index === 5) {
    const boardIndexMax = Math.ceil(lists.length / 5);
    for (let i = 0; i < boardIndexMax; i++) {
    const indexContainer = document.querySelector('#index-container');
     
    const aIndex = document.createElement('a');
    aIndex.classList.add('board__index-link');
     
    const spanIndexText = document.createElement('span');
    spanIndexText.classList.add('board__index');
    spanIndexText.textContent = i + 1;
     
    aIndex.appendChild(spanIndexText);
    indexContainer.appendChild(aIndex);
     
    aIndex.addEventListener('click', () => {
    showBoardListsNewPage(i);
    });
    }
    }
    });
    }
     /*5개 이상 포스팅 시에 다음 페이지로 이동*/
    function showBoardListsNewPage(pageIndex) {
    boardTableBody.textContent = '';
    const lists = JSON.parse(localStorage.getItem(BOARDLIST_LS));
    const limitPage = pageIndex * 5;
     
    lists.forEach((list, index) => {
    if (index >= limitPage && index < limitPage + 5) {
    const tr = document.createElement('tr');
    tr.classList.add('board__content');
     
    const tdNum = document.createElement('td');
    tdNum.classList.add('board__content-column');
    tdNum.textContent = list.num;
     
    const aTitle = document.createElement('a');
    aTitle.href = '#';
    aTitle.id = `link-to-content${index}`;
     
    const tdTitle = document.createElement('td');
    tdTitle.classList.add('board__content-column');
    tdTitle.textContent = list.title;
     
    aTitle.appendChild(tdTitle);
     
    const tdAuthor = document.createElement('td');
    tdAuthor.classList.add('board__content-column');
    tdAuthor.textContent = list.author;
     
    const tdDate = document.createElement('td');
    tdDate.classList.add('board__content-column');
    tdDate.textContent = list.date;
     
    const tdViews = document.createElement('td');
    tdViews.classList.add('board__content-column');
    tdViews.textContent = list.views;
     
    tr.appendChild(tdNum);
    tr.appendChild(aTitle);
    tr.appendChild(tdAuthor);
    tr.appendChild(tdDate);
    tr.appendChild(tdViews);
     
    boardTableBody.appendChild(tr);
    const linkToContent = document.querySelector(
    `#link-to-content${index}`
    );
    linkToContent.addEventListener('click', onTitleClick);
    }
    });
    }

    if (boardTableBody) {
        showBoardLists();
    }