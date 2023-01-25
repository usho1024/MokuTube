<template>
  <div class="mb-10">
    <v-btn
      :loading="loading"
      outlined
      color="teal darken-2"
      @click="getPlayList"
    >
      クリックでBGMリストを表示
    </v-btn>

    <v-dialog v-model="dialogPlaylist" width="50%">
      <v-card>
        <v-subheader>リストからBGMを選択してください</v-subheader>
        <v-divider />
        <v-sheet height="70vh" class="overflow-y-auto">
          <card-video
            v-for="video in playlist"
            :key="`${video.snippet.resourceId.videoId}`"
            :video="video"
            :selected-video-id="selectedVideo.id"
            @selectVideo="selectVideo"
            @playVideo="playVideo"
          />
        </v-sheet>
        <v-divider />
        <div class="px-6 pt-5 text-caption blue-grey--text text--darken-3">
          選択中：
          <span v-if="selectedVideo.title">
            {{ selectedVideo.title }}
          </span>
          <span v-else>未選択</span>
        </div>
        <v-card-actions>
          <v-btn color="appblue" text @click="dialogPlaylist = false">
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
      dialogPlaylist: false,
      dialogPlayVideo: false,
      loading: false,
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
        this.loading = true
        await axios.get(this.url, { params: this.params }).then((response) => {
          this.playlist = response.data.items
          this.loading = false
        })
      }
      this.dialogPlaylist = true
    },
    selectVideo(id, title) {
      this.selectedVideo.id = id
      this.selectedVideo.title = title
      this.$emit('setBgm', this.selectedVideo.id, this.selectedVideo.title)
    },
    playVideo(id, title) {
      this.playedVideo.id = id
      this.playedVideo.title = title
      this.dialogPlayVideo = true
    },
  },
}
</script>
