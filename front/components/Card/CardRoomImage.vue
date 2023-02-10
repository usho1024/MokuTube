<template>
  <v-card>
    <v-card flat :ripple="false" @click="send">
      <div class="pa-1">
        <v-img
          :src="require(`~/assets/img/room/thumb/${roomImage.imageName}.png`)"
          height="120"
        />
      </div>

      <v-divider />

      <v-list-item dense>
        <v-list-item-content>
          <v-list-item-title class="text-truncate">
            {{ roomImage.name }}
          </v-list-item-title>
        </v-list-item-content>
      </v-list-item>
      <v-list-item dense>
        <v-list-item-content>
          <v-list-item-title class="text-truncate">
            席数：{{ roomImage.numberOfSeats }}
          </v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-card>

    <v-overlay
      dark
      absolute
      :value="roomImage.id === selectedImageId"
      class="font-weight-bold"
    >
      <span>選択中</span>
    </v-overlay>
  </v-card>
</template>

<script>
export default {
  props: {
    roomImage: {
      type: Object,
      default: null,
    },
    selectedImageId: {
      type: Number,
      default: null,
    },
  },
  methods: {
    send() {
      this.$emit('setImage', this.roomImage.id, this.roomImage.name)
    },
  },
}
</script>
