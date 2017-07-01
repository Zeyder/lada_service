//Проверка ввод только чисел, точек и двоеточия
window.inputOnlyInt = function (event){
    return ['0','1','2','3','4','5','6','7','8','9','0',':','.', ' '].indexOf(event.key) != -1;
}