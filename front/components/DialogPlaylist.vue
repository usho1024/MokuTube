<template>
  <v-dialog
    v-model="dialog"
    scrollable
    width=50%
  >
    <template #activator="{ on, attrs }">
      <v-btn
        color="primary"
        v-bind="attrs"
        v-on="on"
        @click="getPlayList"
      >
        クリックでBGMリストを表示
      </v-btn>
    </template>

    <v-card>
      <v-card-title>リストからBGMを選択してください</v-card-title>
      <v-divider/>
      <v-sheet class="pa-5" height=70vh>
        ああああ
      </v-sheet>
      <v-divider/>
      <v-card-actions>
        <v-btn
          color="blue darken-3"
          text
          @click="dialog = false"
        >
          保存して終了
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      dialog: false,
      playlist: null,
      url: 'https://www.googleapis.com/youtube/v3/playlistItems',
      params: {
        part: 'snippet',
        playlistId: 'PLY1HAIrAzeUxbdEYv8vM98Vx0_L9kEM_G',
        maxResults: '50',
        key: 'AIzaSyAy_YnIr0huJ4IC7TkkHhkybIrl2B3x7rg',
      },
    }
  },
  methods: {
    async getPlayList() {
      if (!this.playlist) {
        await axios.get(this.url, { params: this.params })
          .then(response => {
            this.playlist = response.data.items
          })
      }
    },
  },
}
</script>
