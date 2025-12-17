function addTodo() {
    const input = document.getElementById("todoInput");
    const todoText = input.value.trim();

    if (todoText === "") {
        alert("Please enter a todo");
        return;
    }

    // Create li
    const li = document.createElement("li");

    // Create text
    const span = document.createElement("span");
    span.innerText = todoText;

    // Create delete button
    const deleteBtn = document.createElement("button");
    deleteBtn.innerText = "Delete";
    deleteBtn.className = "delete-btn";

    deleteBtn.onclick = function () {
        li.remove();   // remove todo
    };

    li.appendChild(span);
    li.appendChild(deleteBtn);

    document.getElementById("todoList").appendChild(li);

    input.value = "";
}
