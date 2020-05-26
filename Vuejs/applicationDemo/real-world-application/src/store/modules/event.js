import EventService from '@/services/EventService.js';

export const namespaced = true;

export const state = {
  events: [],
  eventsTotal: undefined,
  event: {}
};

export const mutations = {
  ADD_EVENT(state, event) {
    state.events.push(event);
  },
  SET_EVENTS(state, events) {
    state.events = events;
  },
  SET_NB_EVENTS(state, value) {
    state.eventsTotal = value;
  },
  SET_EVENT(state, event) {
    state.event = event;
  }
};

export const actions = {
  createEvent({ commit }, event) {
    return EventService.postEvent(event).then(() => {
      commit('ADD_EVENT', event);
    });
  },
  //on peut passer aux actions ou aux mutations un payload
  //sous forme de variable ou d'objet
  fetchEvents({ commit }, { perPage, page }) {
    //l'objet est destructuré et on peut acceder aux
    //propriétés de l'objet comme de simple variable
    EventService.getEvents(perPage, page)
      .then(response => {
        const nbEvents = response.headers['x-total-count'];
        commit('SET_NB_EVENTS', nbEvents);
        const events = response.data;
        commit('SET_EVENTS', events);
      })
      .catch(error => {
        console.log('Error api :', error);
      });
  },
  fetchEvent({ commit, getters }, id) {
    const event = getters.getEventById(id);
    console.log('event:', event);
    if (event) {
      commit('SET_EVENT', event);
    } else {
      EventService.getEvent(id)
        .then(response => {
          const event = response.data;
          commit('SET_EVENT', event);
        })
        .catch(error => {
          console.log('Error:', error);
        });
    }
  }
};

export const getters = {
  catLength: state => {
    return state.categories.length;
  },
  getEventById: state => id => {
    return state.events.find(event => event.id === id);
  }
};
