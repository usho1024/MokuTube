<template>
  <v-dialog v-model="dialog" scrollable width="50%">
    <template #activator="{ on, attrs }">
      <v-btn color="primary" v-bind="attrs" v-on="on" @click="getPlayList">
        クリックでBGMリストを表示
      </v-btn>
    </template>

    <v-card>
      <v-subheader>リストからBGMを選択してください</v-subheader>
      <v-divider />
      <v-simple-table height="70vh">
        <template #default>
          <tbody>
            <tr v-for="video in playlist" :key="video.snippet.title">
              <td>
                <v-img :src="video.snippet.thumbnails.default.url" />
              </td>
              <td @click="test">{{ video.snippet.title }}</td>
              <td>
                <v-btn color="primary"> 試聴する </v-btn>
              </td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
      <v-divider />
      <v-card-actions>
        <v-card-subtitle> 選択しているBGM： </v-card-subtitle>
        <v-btn color="blue darken-3" text @click="dialog = false">
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
        await axios.get(this.url, { params: this.params }).then((response) => {
          this.playlist = response.data.items
        })
      }
    },
    test() {
      console.log('test')
    },
  },
}
</script>
