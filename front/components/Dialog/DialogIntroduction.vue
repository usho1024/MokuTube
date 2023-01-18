<template>
  <v-dialog v-model="dialog" width="500">
    <template #activator="{ on }">
      <v-btn small color="primary" dark v-on="on">自己紹介文を見る</v-btn>
    </template>

    <v-card>
      <v-card-text v-if="introduction" class="pa-5">{{
        introduction
      }}</v-card-text>
      <v-card-text v-else class="pa-5"
        >このユーザーは自己紹介文を設定していません</v-card-text
      >

      <v-divider />

      <v-card-actions>
        <v-btn color="primary" text @click="dialog = false">閉じる</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
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
