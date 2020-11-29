  
const Todoform = document.querySelector(".js-TodoForm"),
TodoInput = Todoform.querySelector("input"),
TodoList = document.querySelector(".js-TodoList");
// const  TODO_LS = "Todos";
let date = new Date();
/*calendar의 todo와 연동하기 위해 날짜로 같은 key값을 넣음*/
let  TODO_LS = (date.getDate()) + "/" + (date.getMonth() + 1) + "/" + date.getFullYear();
console.log(TODO_LS);
let TodoArr = [];

/*todo삭제*/
function DeleteTodo(event)
{
const btn = event.target;
const li = btn.parentNode;
TodoList.removeChild(li);
const CleanTodos = TodoArr.filter(function(Todo){
return Todo.id !== parseInt(li.id);
});
TodoArr = CleanTodos;
SaveTodos();
}


/*todo세이브*/
function SaveTodos()
{ 
localStorage.setItem(TODO_LS, JSON.stringify(TodoArr));
}
/*todo 화면 출력*/
function PaintTodo(text)
{
const li = document.createElement("li");
const delBtn = document.createElement("button");
delBtn.classList.add('btn');
delBtn.classList.add('btn-danger');
delBtn.innerText ="❌";
delBtn.addEventListener("click", DeleteTodo);

const span = document.createElement("span");
span.innerText = text +" ";
const newId = TodoArr.length + 1;

li.appendChild(span);
li.appendChild(delBtn);
li.id  = newId;
TodoList.appendChild(li);
const TodoObj = {
 id : newId,   
text : text,
};
TodoArr.push(TodoObj);
SaveTodos()
}

function HandleSubmit(event)
{
event.preventDefault();
const currentVlaue = TodoInput.value;
PaintTodo(currentVlaue);
TodoInput.value ="";
}
/*저장된 todo 로드*/
function loadTodos()
{
const LoadedTodos = localStorage.getItem(TODO_LS);
if(LoadedTodos !== null)
{
const parsedTodos = JSON.parse(LoadedTodos);
parsedTodos.forEach(function(Todo){
    PaintTodo(Todo.text);
});
}
}

function start()
{
loadTodos();
Todoform.addEventListener("submit", HandleSubmit);
}
start();