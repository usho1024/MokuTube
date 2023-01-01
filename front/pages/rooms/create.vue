<template>
  <v-container
    class="pa-0"
  >
    <v-row
      justify="center"
    >
      <v-col
        cols="6"
      >
        <v-stepper
          v-model="currentStep"
          vertical
        >
          <v-subheader >
            ルームを作成する
          </v-subheader>
          <v-stepper-step
            :complete="currentStep > 1"
            step="1"
          >
            ルーム名を入力してください（30文字以内）
          </v-stepper-step>

          <v-stepper-content step="1">
            <v-text-field
              v-model="room.name"
              :counter="30"
              label="ルーム名を入力する"
            />
            <v-btn
              :disabled="!room.name"
              color="primary"
              class="mr-3"
              @click="stepUp"
            >
              続ける
            </v-btn>
            <v-btn
              nuxt
              color="warning"
              to="/rooms"
            >
              ルーム一覧に戻る
            </v-btn>
          </v-stepper-content>

          <v-stepper-step
            :complete="currentStep > 2"
            step="2"
          >
            ルームのイメージを選択してください
          </v-stepper-step>

          <v-stepper-content step="2">
            <v-card
              color="grey lighten-1"
              class="mb-12"
              height="200px"
            ></v-card>
            <v-btn
              color="primary"
              class="mr-3"
              @click="stepUp"
            >
              続ける
            </v-btn>
            <v-btn
              color="warning"
              @click="stepDown"
            >
              1つ前に戻る
            </v-btn>
          </v-stepper-content>

          <v-stepper-step
            :complete="currentStep > 3"
            step="3"
          >
            ルーム内で再生するBGMを選択してください
          </v-stepper-step>

          <v-stepper-content step="3">
            <v-card
              color="grey lighten-1"
              class="mb-12"
              height="200px"
            ></v-card>
            <v-btn
              color="primary"
              class="mr-3"
              @click="stepUp"
            >
              続ける
            </v-btn>
            <v-btn
              color="warning"
              @click="stepDown"
            >
              1つ前に戻る
            </v-btn>
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
            <v-btn
              nuxt
              color="primary"
              to="/rooms"
              class="mr-3"
            >
              OK
            </v-btn>
            <v-btn
              color="warning"
              @click="stepDown"
            >
              1つ前に戻る
            </v-btn>
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
    data(){
      return{
        currentStep: 1,
        room: {
          name: '',
          imageId: null,
          bgmName: null,
          bgmUrl: null
        },
        roomImages: [
          'private-room',
        ]
      }
    },
    methods: {
      stepUp() {
        this.currentStep++
      },
      stepDown() {
        this.currentStep--
      }
    }
  }
</script>
