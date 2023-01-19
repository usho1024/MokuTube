<template>
  <v-container class="pa-0">
    <v-row justify="center" no-gutters>
      <v-col xl="8" md="10">
        <v-card>
          <v-img
            dark
            src="https://picsum.photos/id/20/1920/1080?blur=2"
            gradient="to top right, rgba(58,99,255,.6), rgba(42,179,252,.9)"
            :height="450"
          >
            <v-row align="center" justify="center" :style="{ height: '450px' }">
              <v-col cols="12" class="text-center">
                <p class="text-h4 mt-15 mb-10">
                  独学、だけどあなたはひとりじゃない。
                </p>
                <p class="text-h5 mb-10">
                  MokuTube（もくつべ）は会員登録不要で使えるオンライン自習室サービスです
                </p>
                <v-btn x-large color="teal" class="mb-3" @click="getStarted"
                  >今すぐ使ってみる！</v-btn
                >
                <p class="text-subtitle-1 mb-10">
                  ※パソコンからのみご利用いただけます
                </p>
                <p class="text-h5">
                  現在
                  <span class="mx-2 font-weight-bold">
                    {{ activeUsers }}
                  </span>
                  人のユーザーがもくもく中．．．✍️
                </p>
              </v-col>
            </v-row>
          </v-img>
          <v-sheet color="blue lighten-5">
            <v-row no-gutters>
              <v-col v-for="image in images" :key="image" cols="3">
                <div class="px-3 py-5">
                  <v-img
                    :src="require(`~/assets/img/room/thumb/${image}.png`)"
                    contain
                    height="200"
                  />
                </div>
              </v-col>
            </v-row>
          </v-sheet>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: 'Top',
  auth: false,
  async asyncData({ $axios }) {
    let activeUsers
    await $axios.$get('/api/v1/homes').then((response) => {
      activeUsers = response
    })
    return { activeUsers }
  },
  data() {
    return {
      images: ['kitchen', 'cafe', 'rest-area', 'private-room'],
    }
  },
  computed: {
    currentUser() {
      return this.$store.state.currentUser
    },
  },
  methods: {
    getStarted() {
      if (this.currentUser) {
        this.$router.push('/rooms')
      }
    },
  },
}
</script>
