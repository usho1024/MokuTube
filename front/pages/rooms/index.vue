<template>
  <v-container class="pa-0">
    <v-row justify="center">
      <v-col md="12" xl="8">
        <v-card rounded="lg" class="pa-5">
          <v-card-subtitle class="pa-0 mb-4">ルーム一覧</v-card-subtitle>
          <div>
            <card-room
              v-for="(room, i) in rooms"
              :key="`room-${i}`"
              :room-id="room.id"
              :room-name="room.name"
              :room-image="room.image.name"
              :host-name="room.host.name"
              :host-avatar="room.host.avatar"
              :active-users="room.active_users"
              :number-of-seats="room.image.number_of_seats"
              :class="{ 'mb-3': i < rooms.length - 1 }"
            />
          </div>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: 'RoomsIndex',
  layout: 'logged-in',
  async asyncData({ $axios }) {
    let rooms
    await $axios.$get('/api/v1/rooms').then((response) => (rooms = response))
    return { rooms }
  },
}
</script>
