<template>
  <v-container class="pa-0">
    <v-row justify="center">
      <v-col md="12" xl="8">
        <v-card>
          <v-subheader>ルーム一覧</v-subheader>

          <v-divider class="mb-4" />

          <div class="px-3">
            <v-row no-gutters>
              <v-col
                v-for="(room, i) in rooms"
                :key="`room-${i}`"
                cols="6"
                class="py-0 px-2 mb-4"
              >
                <card-room
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
