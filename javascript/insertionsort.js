var list = [5, 3, 4, 1, 2];
function insertionSort(list) {
    for (var i = 1; i < list.length; i++) {
        var temp = list[i];
        var j = i - 1;
        while (j >= 0 && list[j] > temp) {
            list[j + 1] = list[j];
            j--;
        }
        list[j + 1] = temp;
    }
    return list;
}
