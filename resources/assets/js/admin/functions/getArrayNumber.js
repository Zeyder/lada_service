//Возвращает массив чисел от start до end
export default function(start, end){
    let arr = [];
    for(let i = start ; i <= end; i++){
        if (i < 10){
            arr.push('0' + i);
        }else{
            arr.push(i);
        }
    }
    return arr;
}