import axios from 'axios';

//Single instance of axios for the entire app
const apiClient = axios.create({
  baseURL: 'http://localhost:3000',
  withCredentials: false,
  headers: {
    Accept: 'application/json',
    'Content-Type': 'application/json'
  }
});

//API
export default {
  getEvents(perPage, page) {
    //add argument to the baseURL to make 'http://localhost:3000/events'
    return apiClient.get('/events?_limit=' + perPage +'&_page=' + page);
  },
  getEvent(id) {
    return apiClient.get('/events/' + id);
  },
  postEvent(event) {
    return apiClient.post('/events', event);
  }
};
