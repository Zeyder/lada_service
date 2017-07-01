//Валидация формата времени
export default function(datetime, pattern = /^(\d{2}\.\d{2}\.\d{4} \d{2}:\d{2})$/){
    return pattern.test(datetime.trim());
}