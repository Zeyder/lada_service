//Миксин для записей
export default {
    methods: {
        //Получаем класс статуса
        getClassStatus(card){
            switch(this.getStatus(card)){
                case 'Задержано': {
                    return {
                        'text_danger': true
                    }
                }
                case 'На стоянке': {
                    return {
                        'text_warning': true
                    }
                }
                case 'Выдано': {
                    return {
                        'text_success': true
                    }
                }
            }
        },
        //Возвращает статус записи
        getStatus(card){
            if (card.date_end == ''){
                if (card.date_parking != ''){
                    return 'На стоянке'
                }else{
                    return 'Задержано';
                }
            }else{
                return 'Выдано';
            }
        },
        show(card){
            this.$store.commit('setEditableCard', card);
            this.$store.commit('toggleModal', 'showFine');
        }
    }
}