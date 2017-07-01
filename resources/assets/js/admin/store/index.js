import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';
import timeFunc from '../functions/timeFunc.js';

Vue.use(Vuex);

 let isFinded = function(item, pattern){
    return String(item).toLowerCase().indexOf(String(pattern).trim().toLowerCase()) != -1;
}

export default new Vuex.Store({
    state: {
        //Строка поиска
        searchQuery: '',
        //Записи штрафов
        cards: window.__INITIAL_STATE__.state.cards,
        //Архивные записи
        arсhiveCards: [],
        //Пользователи системы
        users: window.__INITIAL_STATE__.state.users,
        //Жетоны
        token_numbers: window.__INITIAL_STATE__.state.token_numbers,
        //Редактируемая запись
        editableCard: null,
        editableTokenNumber: null,
        editableUser: null,
        //Модальные окна
        modals: {
            addFine: false,
            showFine: false,
            showUser: false,
            addTokenNumber: false,
            addUser: false,
            editFine: false,
            editTokenNumber: false,
            editUser: false
        },
        //Информация о текущем пользователе
        user: window.__INITIAL_STATE__.user,
        //Активный компонент
        activeComponent: 'Cars'
    },
    getters: {
        //Фильтрованные карточки
        filteredCards(state){
            let searchQuery = state.searchQuery;
            let cards = state.cards;
           
            if (searchQuery != ''){
                cards = cards.filter(item => {
                    let keys = Object.keys(item);
                    let is = isFinded(item[keys[0]], searchQuery);
                    for(let i = 1 ; i < keys.length ; i++){
                        is = is || isFinded(item[keys[i]], searchQuery);
                    }
                    return is && item.archive == 0;
                });
            }

            

            return cards.filter(item => {
                return item.archive == 0;
            }).sort((a, b) => {
                let dateA = new Date(timeFunc(a.date_start));
                let dateB = new Date(timeFunc(b.date_start));
                return moment(dateB).valueOf() - moment(dateA).valueOf();
            });

        },
        //Фильрованные архивные карточки
        filteredArchiveCards(state){
            let searchQuery = state.searchQuery;
            let cards = state.arсhiveCards;
           
            if (searchQuery != ''){
                cards = cards.filter(item => {
                    let keys = Object.keys(item);
                    let is = isFinded(item[keys[0]], searchQuery);
                    for(let i = 1 ; i < keys.length ; i++){
                        is = is || isFinded(item[keys[i]], searchQuery);
                    }
                    return is;
                });
            }
            return cards.sort((a, b) => {
                let dateA = new Date(timeFunc(a.date_start));
                let dateB = new Date(timeFunc(b.date_start));
                return moment(dateB).valueOf() - moment(dateA).valueOf();
            });
        },
        //Фильтрованные жетоны
        filteredTokenNumbers(state){
            let tags = state.token_numbers
            if (state.searchQuery != ''){
                tags = tags.filter( item => item.number.toLowerCase().indexOf(state.searchQuery.trim().toLowerCase()) != -1);
            }
            return tags.slice().sort((a,b)=> {
                return Number(a.number) - Number(b.number);
            });
        },
        filteredUsers(state){
            return state.users.filter(user => {
                let keys = Object.keys(user);
                let is = isFinded(user[keys[0]], state.searchQuery);
                for(let i = 1 ; i < keys.length ; i++){
                    is = is || isFinded(user[keys[i]], state.searchQuery);
                }
                return is;
            });
        }
    },
    mutations: {
        //Запоминаем записи штрафов
        setCards(state, cards){
            state.cards = cards;
        },
        //Запоминаем активный компонент
        setActiveComponent(state, component){
            state.activeComponent = component;
        },
        //Запоминаем все жетоны
        setTokenNumbers(state, tokens){
            state.token_numbers = tokens;
        },
        //Добавляем новый жетон
        addTokenNumber(state, token){
            state.token_numbers.push(token);
        },
        //Запоминаем строку поиска
        setSearchQuery(state, searchQuery){
            state.searchQuery = searchQuery;
        },
        //Добавление штрафа
        addCard(state, card){
            state.cards.unshift(card);
        },
        //Обновление записи после упешной смены данных
        editCard(state, card){
            let cardFinded = state.cards.find(item => {
                return item.id == card.id;
            }) || state.arсhiveCards.find(item => {
                return item.id == card.id;
            });
            if (cardFinded != undefined){
                for(let key in cardFinded){
                    cardFinded[key] = card[key];
                }
            }
        },
        //Открытие/закрытие модалки
        toggleModal(state, name){
            if (name != ''){
                state.modals[name] = !state.modals[name];
            }
            for (let key in state.modals){
                if (key != name){
                    state.modals[key] = false;
                }
            }
        },
        //Запоминаем запись которую будем редактировать
        setEditableCard(state, card){
            let i = state.cards.indexOf(card); 
            if (i != -1){
                state.editableCard = state.cards[i];
            }
        },
        setEditableTokenNumber(state, token_number){
            state.editableTokenNumber = token_number;
        },
        setEditableUser(state, user){
            state.editableUser = user;
        },
        //Запоминаем архивные карточки
        setArсhiveCards(state, cards){
            state.arсhiveCards = cards;
        },
        //Находим и удаляем жетон
        unsetTokenNumber(state, tag){
            state.token_numbers.splice(state.token_numbers.indexOf(tag), 1);
            state.editableTokenNumber = null;
        },
        unsetUser(state, user){
            state.users.splice(state.users.indexOf(user), 1);
            state.editableUser = null;
        },
        addUser(state, user){
            state.users.push(user);
        },
        editTokenNumber(state, token_number){
            let tokenNumberFinded = state.token_numbers.find(item => {
                return item.id == token_number.id;
            });
            if (tokenNumberFinded != undefined){
                for(let key in tokenNumberFinded){
                    tokenNumberFinded[key] = token_number[key];
                }
            }
        },
        editUser(state, user){
            let userFinded = state.users.find(item => {
                return item.id == user.id;
            });
            if (userFinded != undefined){
                for(let key in userFinded){
                    userFinded[key] = user[key];
                }
            }
        }
    },
    actions: {
        ADD_TOKEN_NUMBER({commit}, {token , resolve, reject}){
            return axios.post('/token_number', {number: token}).then( response => {
                commit('addTokenNumber', {
                    id: response.data,
                    number: token
                });
                resolve(token);
            }).catch(e => {
                reject(e);
                console.error(e);
            });
        },
        UPDATE_TOKEN_NUMBER({commit}, {token , resolve, reject}){
            return axios.put(`/token_number/${token.id}`, token).then( response => {
                commit('editTokenNumber', token);
                resolve(token);
            }).catch(e => {
                reject(e);
                console.error(e);
            });
        },
        //Добавление ЗТС
        ADD_FINE({state, commit}, {fine, resolve, reject}){
            return axios.post('/fines', fine).then( response => {
                fine['id'] = response.data;
                fine['responsible'] = state.user.full_name;
                commit('addCard', fine);
                resolve();
            }).catch(e => {
                reject(e);
                console.error(e);
            })
        },
        UPDATE_FINE({state, commit}, {fine, resolve, reject}){
            fine['responsible'] = state.user.full_name;
            return axios.put(`/fines/${fine.id}`, fine).then(response => {
                commit('editCard', fine);
                resolve();
            }).catch(e => {
                reject(e);
                console.error(e);
            });
        },
        UPDATE_USER({state, commit}, {user, resolve, reject}){
            return axios.put(`/users/${user.id}`, user).then(response => {
                commit('editUser', user);
                resolve();
            }).catch(e => {
                reject(e);
                console.error(e);
            });
        },
        ADD_USER({commit}, {user, resolve, reject}){
            return axios.post('/users', user).then(response => {
                user['id'] = response.data.id;
                commit('addUser', response.data);
                resolve();
            }).catch(e => {
                reject(e);
                console.error(e);
            });
        },
        GET_ARCHIVE_CARDS({commit}, {resolve, reject}){
            return axios.get('/archives').then(response => {
                commit('setArсhiveCards', response.data);
                resolve();
            }).catch(e => {
                reject(e);
                console.error(e);
            });
        },
        DELETE_TOKEN_NUMBER({commit}, {tag, resolve, reject}){
            return axios.delete(`/token_number/${tag.id}`, tag).then(response => {
                resolve();
                commit('unsetTokenNumber', tag);
            }).catch(e => {
                reject(e);
                console.error(e);
            });
        },
        DELETE_USER({commit}, {user, resolve, reject}){
            return axios.delete(`/users/${user.id}`, user).then(response => {
                resolve();
                commit('unsetUser', user);
            }).catch(e => {
                reject(e);
                console.error(e);
            });
        }
    }
});