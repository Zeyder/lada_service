//Возвращает сегодняшнюю дату
export default function(){
    let date = new Date();
    let dd = date.getDate() < 10 ? '0' + date.getDate() : date.getDate();
    let mm = parseInt(date.getMonth() + 1) < 10 ? '0' + parseInt(date.getMonth() + 1) : parseInt(date.getMonth() + 1);
    let yyyy = date.getFullYear();
    let h = date.getHours() < 10 ? '0' + date.getHours() : date.getHours();
    let m = date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes();
    return {dd,mm,yyyy,h,m};
}