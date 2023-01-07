<template>
  <div class="mb-7">
    <v-btn color="primary" @click="getPlayList">
      クリックでBGMリストを表示
    </v-btn>

    <v-dialog v-model="dialogPlaylist" scrollable width="50%">
      <v-card>
        <v-subheader>リストからBGMを選択してください</v-subheader>

        <v-divider />

        <v-simple-table height="70vh">
          <template #default>
            <tbody>
              <tr
                v-for="item in playlist"
                :id="`${item.snippet.resourceId.videoId}`"
                :key="`${item.snippet.resourceId.videoId}`"
              >
                <td>
                  <v-img :src="item.snippet.thumbnails.default.url" />
                </td>
                <td
                  class="video-title"
                  @click="
                    selectVideo(
                      item.snippet.resourceId.videoId,
                      item.snippet.title
                    )
                  "
                >
                  {{ item.snippet.title }}
                </td>
                <td>
                  <v-btn
                    color="primary"
                    @click="
                      playVideo(
                        item.snippet.resourceId.videoId,
                        item.snippet.title
                      )
                    "
                  >
                    試聴する
                  </v-btn>
                </td>
              </tr>
            </tbody>
          </template>
        </v-simple-table>

        <v-divider />

        <v-card-actions>
          <v-btn color="blue darken-3" text @click="dialogPlaylist = false">
            保存して終了
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <v-dialog v-model="dialogPlayVideo" width="672">
      <v-card>
        <v-subheader>{{ playedVideo.title }}</v-subheader>
        <iframe
          width="672"
          height="378"
          :src="`https://www.youtube.com/embed/${playedVideo.id}`"
          title="YouTube video player"
          frameborder="0"
          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
          allowfullscreen
        />
        <v-card-actions>
          <v-btn color="blue darken-3" text @click="dialogPlayVideo = false">
            閉じる
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      activeVideo: null,
      dialogPlaylist: false,
      dialogPlayVideo: false,
      playlist: null,
      url: 'https://www.googleapis.com/youtube/v3/playlistItems',
      params: {
        part: 'snippet',
        playlistId: 'PLY1HAIrAzeUxbdEYv8vM98Vx0_L9kEM_G',
        maxResults: '50',
        key: 'AIzaSyAy_YnIr0huJ4IC7TkkHhkybIrl2B3x7rg',
      },
      playedVideo: {
        id: null,
        title: null,
      },
      selectedVideo: {
        id: null,
        title: null,
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
      this.dialogPlaylist = true
    },
    playVideo(id, title) {
      this.playedVideo.id = id
      this.playedVideo.title = title
      this.dialogPlayVideo = true
    },
    selectVideo(id, title) {
      this.selectedVideo.id = id
      this.selectedVideo.title = title
      this.$emit('setBgm', this.selectedVideo.id, this.selectedVideo.title)
      if (this.activeVideo) {
        const oldEl = document.getElementById(`${this.activeVideo}`)
        oldEl.style.backgroundColor = null
      }
      this.activeVideo = id
      const newEl = document.getElementById(`${this.activeVideo}`)
      newEl.style.backgroundColor = '#82B1FF'
    },
  },
}
</script>

<style lang="scss" scoped>
.video-title {
  cursor: pointer;
}
</style>
