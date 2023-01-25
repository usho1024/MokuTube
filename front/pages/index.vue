<template>
  <v-container class="pa-0">
    <v-row justify="center" no-gutters>
      <v-col xl="8" md="12">
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
                <v-btn
                  x-large
                  color="teal accent-4"
                  class="mb-3"
                  @click="getStarted"
                  >今すぐ使ってみる！</v-btn
                >
                <div class="text-subtitle-1 mb-8">
                  <div>※パソコンからのみご利用いただけます</div>
                  <div>※ゲスト会員の有効期限は登録後24時間です</div>
                </div>
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

          <v-sheet
            color="blue lighten-5"
            class="py-10 text-center text-h6 indigo--text text--darken-4"
          >
            <div class="mb-16">
              <v-row no-gutters>
                <v-col v-for="image in images" :key="image" cols="3">
                  <v-img
                    :src="require(`~/assets/img/room/thumb/${image}.png`)"
                    contain
                    height="200"
                  />
                </v-col>
              </v-row>
            </div>

            <section class="mb-16">
              <p class="text-h5 title">How to use MokuTube？</p>
              <p class="mb-5">MokuTubeの使い方はとってもシンプル</p>
              <v-row no-gutters justify="center">
                <v-col cols="5" class="text-left ml-5 mb-5">
                  <div class="mb-1">
                    <v-icon color="indigo darken-4">mdi-numeric-1-box</v-icon>
                    ルームを選ぶ、もしくは自分でルームを作成する
                  </div>
                  <div>
                    <v-icon color="indigo darken-4">mdi-numeric-2-box</v-icon>
                    席を選んで着席する
                  </div>
                </v-col>
              </v-row>
              <p>たったこれだけ</p>
              <p>最短3クリックで始めることができます</p>
            </section>

            <section class="mb-16">
              <p class="text-h5 title">What is MokuTube useful for？</p>
              <p class="mb-6">MokuTubeはあなたの独学を加速させます</p>
              <v-row
                v-for="sellingPoint in sellingPoints"
                :key="sellingPoint"
                no-gutters
                justify="center"
              >
                <v-col cols="1">
                  <v-icon color="green" class="ml-12">mdi-check-bold</v-icon>
                </v-col>
                <v-col cols="7" class="text-left">
                  <p>
                    {{ sellingPoint }}
                  </p>
                </v-col>
              </v-row>
            </section>

            <section class="mb-16">
              <p class="mb-8">さあ、あなたもMokuTuberになりませんか？</p>
              <v-btn
                dark
                x-large
                color="teal accent-4"
                class="mb-3"
                @click="getStarted"
                >今すぐ使ってみる！</v-btn
              >
            </section>
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
      sellingPoints: [
        'オンライン自習室なので自宅から無料ですぐに使えます',
        '同じ独学者が集まるので独学のモチベーション維持が期待できます',
        'ルームの滞在時間が自動で記録されるので勉強時間の見える化ができます',
        '勉強に疲れたと思ったらルーム内のBGM視聴機能やチャット機能を使って\nリフレッシュしてみましょう',
      ],
    }
  },
  head() {
    return {
      title: 'MokuTube - 会員登録不要で使えるオンライン自習室',
      titleTemplate: '',
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

<style lang="scss" scoped>
.title {
  text-decoration: underline;
  text-decoration-thickness: 0.5em;
  text-decoration-color: rgba(0, 191, 165, 0.6);
  text-underline-offset: -0.2em;
  text-decoration-skip-ink: none;
}
</style>
