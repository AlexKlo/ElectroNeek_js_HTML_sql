var arr = [1, 5, 6, 0, 40, 1, 19, 3, 2, 0, -5];

function sort_up(v1,v2) {  return v1-v2;  }

function sort_down(v1,v2) {  return v2-v1;  }

function my_sort(arr, flag = "up") {
if (flag=="up") return console.log(arr.sort(sort_up));
if (flag=="down") return console.log(arr.sort(sort_down));
}

console.log(arr)
my_sort(arr)
my_sort(arr, "down")
