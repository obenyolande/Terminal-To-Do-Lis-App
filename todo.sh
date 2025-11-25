#! /bin/bash

#Define the task file
TASK_FILE="task.txt"

#Function to add task
add_task() {
if [[ -n "$1" ]]; then
  echo "$1" >> task.txt
  echo "Task added $1"
else
    echo "Error: task text is required"
fi
}

#Function to list all task
List_task() {
    if [[ -f "$TASK_FILE" ]]; then
       echo "Task:"
       cat -n "$TASK_FILE"
    else
       echo "No task available"
    fi
}

 #function to delete task
delete_task() {
  if [[ -f "$TASK_FILE" ]] && [[ $2 -gt 0 ]]; then
    sed -1 '' '2d' "$TASK_FILE"
    echo "task $2 deleted"
else
    echo "error: invalid ask number"
fi

}
#Main Logic
case $1 in
add)
add_task "$2"
;;
list)
List_task
;;
del)

if [[ $(wc -l < $TASK_FILE) -ge 2 && $2 -eq 2 ]]; then 
    sed -i '2d' "task.txt"
else
   echo "file has only one line"
fi
  ;;
  *)
    echo "Usage: $0 [add|list] [task text]"
    echo "add <task text>: add a new task"
    echo "usage ./todo.sh, del 2"
  ;;
esac
