//Проверка строки на пустоту
export default function(str, count = 3){
    return str.trim().length >= count;
}