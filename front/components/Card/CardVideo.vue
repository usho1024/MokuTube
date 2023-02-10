<template>
  <v-card flat rounded="0">
    <v-card flat @click="selectVideo">
      <v-row no-gutters align="center">
        <v-col cols="2">
          <v-img
            :src="video.snippet.thumbnails.default.url"
            height="82"
            class="my-1 ml-5"
          />
        </v-col>
        <v-col cols="9" class="px-5">
          {{ video.snippet.title }}
        </v-col>
        <v-col cols="1">
          <v-btn icon large color="#da1725" @click.stop="playVideo">
            <v-icon>mdi-youtube</v-icon>
          </v-btn>
        </v-col>
      </v-row>
    </v-card>

    <v-overlay
      dark
      absolute
      :value="video.snippet.resourceId.videoId === selectedVideoId"
      class="font-weight-bold"
    >
      <span>選択中</span>
    </v-overlay>
  </v-card>
</template>

<script>
export default {
  props: {
    video: {
      type: Object,
      default: null,
    },
    selectedVideoId: {
      type: String,
      default: null,
    },
  },
  methods: {
    selectVideo() {
      this.$emit(
        'selectVideo',
        this.video.snippet.resourceId.videoId,
        this.video.snippet.title
      )
    },
    playVideo() {
      this.$emit(
        'playVideo',
        this.video.snippet.resourceId.videoId,
        this.video.snippet.title
      )
    },
  },
}
</script>
