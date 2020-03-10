pragma solidity ^0.5.0;

contract TodoList {
    uint public taskCount = 0;
// Making a struct as class or something related to make
// object that will store our necessary data
    struct Task {
        uint id;
        string content;
        bool completed;
    }

    // We will use something called map to make key value pairs
    //to store all the task
    mapping (uint => Task) public task;

    event TaskCreated(
        uint id,
        string content,
        bool completed
    );

    event TaskCompleted(
        uint id,
        bool completed
    );

    constructor() public {
        createTask("Welcome to blockchain");
    }

    function createTask(string memory _content) public {
        taskCount ++;
        task[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
        Task  memory _task = task[_id];
        _task.completed = !_task.completed;
        task[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }
}