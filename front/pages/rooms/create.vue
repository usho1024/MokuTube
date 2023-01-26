<template>
  <v-container class="pa-0">
    <v-row justify="center">
      <v-col xl="6" md="8">
        <v-stepper v-model="currentStep" vertical>
          <v-subheader>ルーム作成</v-subheader>

          <v-divider />

          <v-stepper-step :complete="currentStep > 1" step="1">
            ルーム名を入力してください（30文字以内）
          </v-stepper-step>

          <v-stepper-content step="1">
            <v-form v-model="valid" @submit.prevent="stepUp">
              <v-text-field
                v-model="room.name"
                :rules="nameRules"
                :counter="30"
                label="ルーム名を入力する"
                class="mb-6"
                required
              />
            </v-form>

            <div class="mb-2">
              <button-step-up :disabled="!valid" @stepUp="stepUp" />
              <v-btn outlined exact nuxt color="yellow darken-4" to="/rooms"
                >ルーム一覧に戻る</v-btn
              >
            </div>
          </v-stepper-content>

          <v-stepper-step :complete="currentStep > 2" step="2">
            ルームのイメージを選択してください
          </v-stepper-step>

          <v-stepper-content step="2">
            <v-sheet
              height="40vh"
              class="grey lighten-4 mb-6 pa-5 overflow-auto"
            >
              <v-row>
                <v-col
                  v-for="roomImage in roomImages"
                  :key="`roomImage-${roomImage.id}`"
                  cols="3"
                  class="pa-2"
                >
                  <card-room-image
                    :room-image="roomImage"
                    :selected-image-id="room.imageId"
                    @setImage="setImage"
                  />
                </v-col>
              </v-row>
            </v-sheet>

            <div class="mb-10 text-body-1">
              <div v-if="room.imageName">選択中： {{ room.imageName }}</div>
              <div v-else>選択中： 未選択</div>
            </div>

            <div class="mb-2">
              <button-step-up :disabled="!room.imageName" @stepUp="stepUp" />
              <button-step-down @stepDown="stepDown" />
            </div>
          </v-stepper-content>

          <v-stepper-step :complete="currentStep > 3" step="3">
            ルーム内で再生するBGMを選択してください
          </v-stepper-step>

          <v-stepper-content step="3">
            <dialog-playlist @setBgm="setBgm" />

            <div class="mb-3 text-body-1">
              <div v-if="room.bgmName" class="text-truncate">
                選択中： {{ room.bgmName }}
              </div>
              <div v-else>選択中： 未選択</div>
            </div>
            <div class="mb-10 text-body-1">
              ※ルーム内にてBGMは自動でループ再生されます
            </div>

            <div class="mb-2">
              <button-step-up :disabled="!room.bgmName" @stepUp="stepUp" />
              <button-step-down @stepDown="stepDown" />
            </div>
          </v-stepper-content>

          <v-stepper-step step="4">
            以下の設定でルームを作成します
          </v-stepper-step>
          <v-stepper-content step="4">
            <div class="mb-10 text-body-1">
              <v-row>
                <v-col cols="2">
                  <div>名前：</div>
                </v-col>
                <v-col cols="10">
                  <div class="text-truncate">
                    {{ room.name }}
                  </div>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="2">
                  <div>イメージ：</div>
                </v-col>
                <v-col cols="10">
                  <div>
                    {{ room.imageName }}
                  </div>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="2">
                  <div>BGM：</div>
                </v-col>
                <v-col cols="10">
                  <div class="text-truncate">
                    {{ room.bgmName }}
                  </div>
                </v-col>
              </v-row>
            </div>

            <div class="mb-2">
              <v-btn
                :disabled="!completed"
                outlined
                color="indigo"
                width="100"
                class="mr-5"
                @click="createRoom"
              >
                O K
              </v-btn>
              <button-step-down @stepDown="stepDown" />
            </div>
          </v-stepper-content>
        </v-stepper>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: 'Create',
  layout: 'room-create',
  data() {
    return {
      currentStep: 1,
      valid: false,
      nameRules: [
        (v) => !!v || 'ルーム名を入力してください',
        (v) => v.length <= 30 || 'ルーム名は30文字以内で設定してください',
      ],
      room: {
        name: '',
        imageId: null,
        imageName: null,
        bgmId: null,
        bgmName: null,
      },
      roomImages: [
        {
          id: 1,
          name: '個室',
          imageName: 'private-room',
          numberOfSeats: 1,
        },
        {
          id: 2,
          name: '小さいオフィス',
          imageName: 'small-office',
          numberOfSeats: 2,
        },
        {
          id: 3,
          name: '大きいオフィス',
          imageName: 'large-office',
          numberOfSeats: 4,
        },
        {
          id: 4,
          name: '夜のバー',
          imageName: 'night-bar',
          numberOfSeats: 4,
        },
        {
          id: 5,
          name: '休憩スペース',
          imageName: 'rest-area',
          numberOfSeats: 5,
        },
        {
          id: 6,
          name: 'キッチン',
          imageName: 'kitchen',
          numberOfSeats: 6,
        },
        {
          id: 7,
          name: 'ブックカフェ',
          imageName: 'book-cafe',
          numberOfSeats: 7,
        },
        {
          id: 8,
          name: '教室',
          imageName: 'classroom',
          numberOfSeats: 10,
        },
        {
          id: 9,
          name: 'カフェ',
          imageName: 'cafe',
          numberOfSeats: 16,
        },
        {
          id: 10,
          name: 'ラウンジ',
          imageName: 'lounge',
          numberOfSeats: 20,
        },
      ],
    }
  },
  head() {
    return {
      title: 'ルーム作成',
    }
  },
  computed: {
    completed() {
      return this.room.name && this.room.imageId && this.room.bgmId || false
    },
  },
  methods: {
    stepUp() {
      if (this.valid) {
        this.currentStep++
      }
    },
    stepDown() {
      this.currentStep--
    },
    setImage(imageId, imageName) {
      this.room.imageId = imageId
      this.room.imageName = imageName
    },
    setBgm(bgmId, bgmName) {
      this.room.bgmId = bgmId
      this.room.bgmName = bgmName
    },
    async createRoom() {
      const params = {
        room_image_id: this.room.imageId,
        name: this.room.name,
        bgm_resource: this.room.bgmId,
      }
      await this.$axios.post('/api/v1/rooms', params).then((response) => {
        this.$router.replace(`/rooms/${response.data.id}`)
      })
    },
  },
}
</script>
