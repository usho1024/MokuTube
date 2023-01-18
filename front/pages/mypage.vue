<template>
  <v-container class="pa-0">
    <v-row justify="center" no-gutters>
      <v-col xl="4" md="6">
        <v-card>
          <v-img
            height="180px"
            :src="image_src"
            gradient="rgba(100,115,201,.33), rgba(25,32,72,.33)"
          >
            <v-card-title class="white--text font-weight-bold mt-10 ml-2">
              <v-avatar size="100">
                <img :src="user.avatar.url" />
              </v-avatar>
              <p class="ml-3">{{ user.name }}</p>
            </v-card-title>
          </v-img>

          <div class="pa-7">
            <div class="mb-8">
              <span v-if="user.introduction">
                {{ user.introduction }}
              </span>
              <span v-else>自己紹介文が設定されていません</span>
            </div>
            <div class="grey--text text--darken-2 mb-7">
              <p>
                <v-icon class="mr-3">mdi-lead-pencil</v-icon>
                <span v-if="user.work">
                  {{ user.work }}
                </span>
                <span v-else>作業内容が設定されていません</span>
              </p>
              <p>
                <v-icon class="mr-3">mdi-database-clock</v-icon>
                {{ secToTime(user.total_stay_time) }}
              </p>
              <p>
                <v-icon class="mr-3">mdi-email</v-icon>
                {{ user.email }}
              </p>
              <p>
                <v-icon class="mr-3">mdi-account-tag</v-icon>
                <span v-if="user.guest"
                  >ゲストユーザー
                  <v-tooltip top>
                    <template #activator="{ on }">
                      <v-icon color="grey darken-1" class="ml-5" dark v-on="on">
                        mdi-information
                      </v-icon>
                    </template>
                    <span
                      >ゲストユーザーは登録から24時間後にアカウントが使用できなくなります</span
                    >
                  </v-tooltip></span
                >
                <span v-else>一般ユーザー</span>
              </p>
              <p>
                <v-icon class="mr-3">mdi-calendar</v-icon>
                {{ dateFormat(user.created_at) }}からMokuTubeを利用しています
              </p>
            </div>

            <dialog-user-edit :user.sync="user" />
          </div>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import moment from 'moment'

export default {
  name: 'Mypage',
  async asyncData({ $axios, store }) {
    let user
    await $axios
      .$get(`/api/v1/users/${store.state.currentUser.id}`)
      .then((response) => {
        user = response
      })
    return { user }
  },
  data() {
    return {
      image_src: require('~/assets/img/meterial-blue.jpeg'),
    }
  },
  methods: {
    secToTime(rawsec) {
      const min = String(Math.trunc(rawsec / 60) % 60).padStart(2, 0)
      const hour = String(Math.trunc(rawsec / 3600)).padStart(2, 0)
      const time = hour + '時間' + min + '分'
      return time
    },
    dateFormat(date) {
      return moment(date).format('YYYY/MM/DD')
    },
  },
}
</script>
