<template>
  <div>
    <v-btn small color="primary" dark @click="dialog = true"
      >自己紹介文を見る</v-btn
    >

    <v-dialog v-model="dialog" width="500">
      <v-card>
        <v-card-text v-if="introduction" class="pa-5">{{
          introduction
        }}</v-card-text>
        <v-card-text v-else class="pa-5"
          >このユーザーは自己紹介文を設定していません</v-card-text
        >

        <v-divider />

        <v-card-actions>
          <v-btn color="appblue" text @click="dialog = false">閉じる</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
export default {
  props: {
    introduction: {
      type: String,
      default: null,
    },
  },
  data() {
    return {
      dialog: false,
    }
  },
}
</script>
