<template>
  <v-container>
    <v-row
      justify="center"
    >
      <v-col
        cols="10"
      >
        <v-card
          color="indigo lighten-5"
          rounded="lg"
          class="pa-10"
        >
          <v-row>
            <v-col
              v-for="(room, i) in rooms"
              :key="`room-${i}`"
              cols="3"
              class="pa-5"
            >
              <index-room
                :room-id="room.id"
                :room-name="room.name"
                :room-image="room.image.name"
                :host-name="room.host.name"
                :host-avatar="room.host.avatar"
                :active-users="room.active_users"
                :number-of-seats="room.image.number_of_seats"
              />
            </v-col>
          </v-row>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: 'RoomsIndex',
  layout: 'logged-in',
  async asyncData ({ $axios }) {
    let rooms
    await $axios.$get('/api/v1/rooms')
      .then(response => (rooms = response))
    return { rooms }
  }
}
</script>
