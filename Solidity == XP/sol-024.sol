// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }
    
    Todo[] public todos;
    
    function create(string calldata _text) external {
     todos.push(Todo({text: _text, completed: false}));
    }
    
    function updateText(uint _index, string calldata _text) external {
         todos[_index].text = _text;
    }
    
    function toggleCompleted(uint _index) external returns (bool) {
        todos[_index].completed = !todos[_index].completed;
    }
    
    function get(uint _index) external view returns (string memory, bool) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }
}