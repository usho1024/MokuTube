<template>
  <v-container class="pa-0">
    <v-row justify="center">
      <v-col xl="6" md="8">
        <v-stepper v-model="currentStep" vertical class="stepper">
          <v-subheader>ルーム作成</v-subheader>

          <v-divider />

          <v-stepper-step :complete="currentStep > 1" step="1">
            ルーム名を入力してください
          </v-stepper-step>

          <v-stepper-content step="1">
            <v-form v-model="valid" class="mb-5" @submit.prevent="stepUp">
              <v-text-field
                v-model="room.name"
                :rules="nameRules"
                :counter="30"
                label="ルーム名を入力する"
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
              outlined
              height="40vh"
              class="grey lighten-4 mb-5 pa-5 overflow-auto"
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

            <v-text-field
              :value="room.imageName ? room.imageName : '未選択'"
              label="選択中"
              hide-details
              readonly
              class="mb-5"
            />

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

            <v-text-field
              :value="room.bgmName ? room.bgmName : '未選択'"
              label="選択中"
              hide-details
              readonly
              class="mb-3"
            />
            <div class="mb-10 text-caption">
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
            <div class="mb-10">
              <v-text-field
                v-for="item in items"
                :key="item.value"
                :value="item.value"
                :label="item.label"
                hide-details
                readonly
                :class="{ 'mb-4': item.margin }"
              />
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
        (v) => !!v || '',
        (v) => v.length <= 30 || '文字数オーバーです',
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
      return (this.room.name && this.room.imageId && this.room.bgmId) || false
    },
    items() {
      return [
        {
          value: this.room.name,
          label: '名前',
          margin: true,
        },
        {
          value: this.room.imageName,
          label: 'イメージ',
          margin: true,
        },
        {
          value: this.room.bgmName,
          label: 'BGM',
          margin: false,
        },
      ]
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

<style lang="scss" scoped>
.stepper {
  max-height: calc(100vh - 128px);
}
</style>
