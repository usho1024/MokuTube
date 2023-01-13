<template>
  <v-container class="pa-0">
    <v-row justify="center">
      <v-col xl="8">
        <v-card>
          <v-toolbar>
            <v-toolbar-title class="text-subtitle-1"
              >ルーム一覧</v-toolbar-title
            >

            <v-spacer />

            <template #extension>
              <v-tabs v-model="tab" align-with-title>
                <v-tabs-slider color="blue"></v-tabs-slider>

                <v-tab
                  v-for="menu in menus"
                  :key="menu.title"
                  @click="getRooms(menu.type)"
                >
                  {{ menu.title }}
                </v-tab>
              </v-tabs>
            </template>
          </v-toolbar>

          <v-tabs-items v-model="tab">
            <v-tab-item v-for="menu in menus" :key="menu.type">
              <v-divider />
              <v-sheet v-if="rooms.length" class="grey lighten-4 px-3 pt-5">
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

                <div class="text-center pt-5 pb-10">
                  <v-pagination
                    v-model="page"
                    :length="length"
                    total-visible="10"
                    @input="pageChange"
                  ></v-pagination>
                </div>
              </v-sheet>

              <v-sheet
                v-else
                height="50vh"
                class="pa-10 grey--text text--darken-1"
              >
                <p class="text-h6">Sorry, Active Room Not Found...</p>
                <p>現在、ユーザーが利用しているルームは存在しません😢</p>
                <p>お手数ですが他のタブからルーム一覧をご確認ください</p>
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
    let count
    await $axios
      .$get('/api/v1/rooms', {
        params: {
          type: 'official',
        },
      })
      .then((response) => {
        rooms = response.rooms
        count = response.count
      })
    return { rooms, count }
  },
  data() {
    return {
      tab: null,
      currentTab: 'official',
      menus: [
        { title: '公式ルーム', type: 'official' },
        { title: 'ユーザーが多い順', type: 'active' },
        { title: '作成日時が新しい順', type: 'recent' },
      ],
      page: 1,
      pageSize: 30,
    }
  },
  computed: {
    length() {
      return Math.ceil(this.count / this.pageSize)
    },
  },
  methods: {
    async getRooms(type) {
      await this.$axios
        .get('/api/v1/rooms', {
          params: {
            type,
            page_number: 1,
          },
        })
        .then((response) => {
          this.rooms = response.data.rooms
          this.count = response.data.count
          this.currentTab = type
        })
    },
    async pageChange(pageNumber) {
      await this.$axios
        .get('/api/v1/rooms', {
          params: {
            type: this.currentTab,
            page_number: pageNumber,
          },
        })
        .then((response) => {
          this.rooms = response.data.rooms
          window.scrollTo({ top: 0, behavior: 'smooth' })
        })
    },
  },
}
</script>
