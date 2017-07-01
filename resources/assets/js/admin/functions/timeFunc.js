export default function(date){
    let YYYY = date.split(' ')[0].split('.')[2];
    let mm = date.split(' ')[0].split('.')[1];
    let dd = date.split(' ')[0].split('.')[0];
    let time = date.split(' ')[1];
    return `${YYYY}-${mm}-${dd} ${time}`;
}