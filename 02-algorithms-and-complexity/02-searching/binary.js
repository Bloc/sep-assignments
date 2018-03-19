const binaryIterative = (array, value) => {
  let low = 0;
  let high = array.length - 1;

  while (low <= high) {
    mid = Math.floor((low + high) / 2);

    if (array[mid] > value) {
      high = mid - 1;
    } else if (array[mid] < value){
      low = mid + 1;
    } else {
      return mid;
    }
  }

  return "Value not present."
}
