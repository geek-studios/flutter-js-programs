var list = [5, 3, 4, 1, 2];
var temp = 0;
function sort(list) {
    for (var i = 0; i < list.length; i++) {
        for (var j = i + 1; j < list.length; j++) {
            if (list[i] > list[j]) {
                temp = list[i];
                list[i] = list[j];
                list[j] = temp;
            }
        }
    }
    return list;
}

console.log(sort(list));
