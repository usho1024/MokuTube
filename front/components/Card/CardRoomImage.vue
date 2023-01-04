<template>
  <v-card
    rounded="lg"
    elevation="5"
    :ripple="false"
    width="200px"
    @click="send"
  >
    <v-img
      :src="require(`~/assets/img/room/thumb/${imageName}.png`)"
      height="150px"
    />

    <v-divider/>

    <v-list>
      <v-list-item
        dense
      >
        <v-list-item-content>
          <v-list-item-title
            class="text-truncate"
          >
            {{ name }}
          </v-list-item-title>
        </v-list-item-content>
      </v-list-item>
      <v-list-item
        dense
      >
        <v-list-item-content>
          <v-list-item-title
            class="text-truncate"
          >
            席数：{{ numberOfSeats }}
          </v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-card>
</template>

<script>
export default {
  props: {
    id: {
      type: Number,
      default: null
    },
    name: {
      type: String,
      default: null
    },
    imageName: {
      type: String,
      default: null
    },
    numberOfSeats: {
      type: Number,
      default: null
    }
  },
  methods: {
    send() {
      this.$emit("my-click", this.name, this.id)
    }
  }
}
</script>
