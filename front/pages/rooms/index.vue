<template>
  <v-container>
    <v-row>
      <v-col
        v-for="(room, i) in rooms"
        :key="`room-${i}`"
        cols="3"
      >
        <index-room
          :id="room.id"
          :name="room.name"
        />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: 'RoomsIndex',
  layout: 'logged-in',
  async asyncData ({ $axios, store }) {
    await $axios.$get('/api/v1/rooms')
      .then(response => store.dispatch('getRooms', response))
  },
  computed: {
    rooms() {
      return this.$store.state.rooms
    },
    // dateFormat () {
    //   return (date) => {
    //     const dateTimeFormat = new Intl.DateTimeFormat(
    //       'ja', { dateStyle: 'medium', timeStyle: 'short' }
    //     )
    //     return dateTimeFormat.format(new Date(date))
    //   }
    // }
  },
  destroyed() {
    this.$store.dispatch('getRooms', null)
  }
}
</script>
