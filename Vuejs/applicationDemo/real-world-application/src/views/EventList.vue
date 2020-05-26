<template>
  <div>
    <h1>Events for {{user.user.name}}</h1>
    <EventCard2 v-for="event in event.events" :key="event.id" :event="event" />

    <template v-if="page != 1">
      <router-link
        :to="{ name: 'event-list', query: { page: page - 1 } }"
        rel="prev"
        >Previous page</router-link
      >
      |
    </template>

    <template v-if="event.eventsTotal > page * 3">
      <router-link
        :to="{ name: 'event-list', query: { page: page + 1 } }"
        rel="next"
        >Next page</router-link
      >
    </template>
  </div>
</template>

<script>

import EventCard2 from '@/components/EventCard.vue';
import { mapState } from 'vuex';

export default {
  components: {
    EventCard2
  },
  created() {
    this.$store.dispatch('event/fetchEvents', {
      perPage: 3,
      page: this.page
    });
  },
  computed: {
    page() {
      return parseInt(this.$route.query.page) || 1;
    },
    ...mapState(['event','user'])
  }
};
</script>
