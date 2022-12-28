<template>
  <div
    class="px-4 mb-4"
  >
    <v-row
      no-gutters
    >
      <v-col
        cols="1"
        align-self="start"
      >
        <v-avatar
          size="35px"
        >
          <v-img :src="avatar"/>
        </v-avatar>
      </v-col>
      <v-col
        cols="11"
      >
        <div
          class="ml-3"
        >
          <span
            class="grey--text text--darken-1 mr-2"
          >
            {{ name }}
          </span>
          <span
            class="grey--text text--darken-4"
          >
            {{ body }}
          </span>
        </div>
      </v-col>
    </v-row>
  </div>
</template>

<script>
export default {
  props: {
    body: {
      type: String,
      default: null
    },
    name: {
      type: String,
      default: null
    },
    avatar: {
      type: String,
      default: null
    }
  }
}
</script>
