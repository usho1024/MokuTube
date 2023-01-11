<template>
  <v-container class="pa-0">
    <v-row justify="center">
      <v-col xl="8">
        <v-card>
          <v-toolbar>
            <v-toolbar-title class="text-subtitle-1">ルーム一覧</v-toolbar-title>

            <v-spacer />

            <v-btn icon>
              <v-icon>mdi-magnify</v-icon>
            </v-btn>

            <v-btn icon>
              <v-icon>mdi-dots-vertical</v-icon>
            </v-btn>

            <template #extension>
              <v-tabs v-model="tab" align-with-title>
                <v-tabs-slider color="blue"></v-tabs-slider>

                <v-tab v-for="menu in menus" :key="menu.title" @click="test(menu.method)">
                  {{ menu.title }}
                </v-tab>
              </v-tabs>
            </template>
          </v-toolbar>

          <v-tabs-items v-model="tab">
            <v-tab-item v-for="menu in menus" :key="menu.method">
              <v-divider />
              <v-sheet class="grey lighten-4 px-3 pt-5">
                <v-row no-gutters>
                  <v-col
                    v-for="room in rooms"
                    :key="room.id"
                    cols="6"
                    class="py-0 px-3 mb-5"
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
              </v-sheet>
            </v-tab-item>
          </v-tabs-items>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: 'RoomsIndex',
  async asyncData({ $axios }) {
    let rooms
    await $axios.$get('/api/v1/rooms').then((response) => (rooms = response))
    return { rooms }
  },
  data() {
    return {
      tab: null,
      menus: [
        { title: '最近作成された', method: 'new' },
        { title: 'ルーム内人数が多い', method: 'active' },
        { title: '公式', method: 'official' },
        { title: 'すべて', method: 'all' },
      ],
    }
  },
  methods: {
    test(value) {
      console.log(value)
    },
  },
}
</script>
