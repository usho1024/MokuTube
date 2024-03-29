<template>
  <v-container class="pa-0">
    <v-row justify="center">
      <v-col xl="8">
        <v-card>
          <v-toolbar>
            <v-toolbar-title
              class="text-subtitle-1 blue--text text--accent-3 font-weight-bold"
            >
              現在
              <span class="mx-2">
                {{ activeUsers }}
              </span>
              人のユーザーがもくもく中．．．✍️
            </v-toolbar-title>

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
                    <card-room :room="room" />
                  </v-col>
                </v-row>

                <div class="text-center pt-5 pb-10">
                  <v-pagination
                    v-model="page"
                    :length="length"
                    total-visible="7"
                    @input="pageChange"
                  ></v-pagination>
                </div>
              </v-sheet>

              <v-sheet
                v-else
                height="50vh"
                class="pa-10 grey--text text--darken-1"
              >
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
  layout: 'logged-in',
  async asyncData({ $axios }) {
    const params = { params: { type: 'official' } }
    const response = await $axios.$get('/api/v1/rooms', params)
    const rooms = response.rooms
    const count = response.count
    const activeUsers = response.active_users
    return { rooms, count, activeUsers }
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
  head() {
    return {
      title: 'ルーム一覧',
    }
  },
  computed: {
    length() {
      return Math.ceil(this.count / this.pageSize)
    },
  },
  methods: {
    async getRooms(type) {
      const params = { params: { type, page_number: 1 } }
      const response = await this.$axios.get('/api/v1/rooms', params)
      this.rooms = response.data.rooms
      this.count = response.data.count
      this.activeUsers = response.data.active_users
      this.currentTab = type
      this.page = 1
    },
    async pageChange(pageNumber) {
      scrollTo({ top: 0, behavior: 'smooth' })
      const params = {
        params: { type: this.currentTab, page_number: pageNumber },
      }
      const response = await this.$axios.get('/api/v1/rooms', params)
      this.rooms = response.data.rooms
      this.activeUsers = response.data.active_users
    },
  },
}
</script>
