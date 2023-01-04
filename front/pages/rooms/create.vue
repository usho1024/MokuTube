<template>
  <v-container class="pa-0">
    <v-row justify="center">
      <v-col cols="6">
        <v-stepper v-model="currentStep" vertical>
          <v-subheader> ルームを作成する </v-subheader>
          <v-stepper-step :complete="currentStep > 1" step="1">
            ルーム名を入力してください（30文字以内）
          </v-stepper-step>

          <v-stepper-content step="1">
            <v-text-field
              v-model="room.name"
              :counter="30"
              label="ルーム名を入力する"
              class="mb-3"
            />

            <div class="mb-5">
              <v-btn
                :disabled="!room.name"
                color="primary"
                class="mr-3"
                @click="stepUp"
              >
                続ける
              </v-btn>
              <v-btn nuxt color="warning" to="/rooms"> ルーム一覧に戻る </v-btn>
            </div>
          </v-stepper-content>

          <v-stepper-step :complete="currentStep > 2" step="2">
            ルームのイメージを選択してください
          </v-stepper-step>

          <v-stepper-content step="2">
            <div class="mb-7 pa-5 overflow-x-auto">
              <v-row class="flex-nowrap">
                <v-sheet
                  v-for="roomImage in roomImages"
                  :id="`roomImage-${roomImage.id}`"
                  :key="`roomImage-${roomImage.id}`"
                  rounded="lg"
                  class="pa-3"
                >
                  <card-room-image
                    :id="roomImage.id"
                    :name="roomImage.name"
                    :image-name="roomImage.imageName"
                    :number-of-seats="roomImage.numberOfSeats"
                    @my-click="setImage"
                  />
                </v-sheet>
              </v-row>
            </div>

            <div class="mb-5">選択しているイメージ：{{ room.imageName }}</div>

            <div class="mb-5">
              <v-btn
                :disabled="!room.imageId"
                color="primary"
                class="mr-3"
                @click="stepUp"
              >
                続ける
              </v-btn>
              <v-btn color="warning" @click="stepDown"> 1つ前に戻る </v-btn>
            </div>
          </v-stepper-content>

          <v-stepper-step :complete="currentStep > 3" step="3">
            ルーム内で再生するBGMを選択してください
          </v-stepper-step>

          <v-stepper-content step="3">

            <index-videos/>

            <div class="mb-5">
              <v-btn
                :disabled="!room.imageId"
                color="primary"
                class="mr-3"
                @click="stepUp"
              >
                続ける
              </v-btn>
              <v-btn color="warning" @click="stepDown"> 1つ前に戻る </v-btn>
            </div>
          </v-stepper-content>

          <v-stepper-step step="4">
            以下の設定でルームを作成します
          </v-stepper-step>
          <v-stepper-content step="4">
            <v-card
              color="grey lighten-1"
              class="mb-12"
              height="200px"
            ></v-card>
            <v-btn nuxt color="primary" to="/rooms" class="mr-3"> OK </v-btn>
            <v-btn color="warning" @click="stepDown"> 1つ前に戻る </v-btn>
          </v-stepper-content>
        </v-stepper>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: 'Create',
  layout: 'logged-in',
  data() {
    return {
      currentStep: 3,
      activeImage: null,
      room: {
        name: '',
        imageName: null,
        imageId: null,
        bgmName: null,
        bgmUrl: null,
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
  methods: {
    stepUp() {
      this.currentStep++
    },
    stepDown() {
      this.currentStep--
    },
    setImage(imageName, imageId) {
      this.room.imageName = imageName
      this.room.imageId = imageId
      if (this.activeImage) {
        const oldEl = document.getElementById(`${this.activeImage}`)
        oldEl.style.backgroundColor = null
      }
      this.activeImage = `roomImage-${imageId}`
      const newEl = document.getElementById(`${this.activeImage}`)
      newEl.style.backgroundColor = '#82B1FF'
    },
  },
}
</script>
