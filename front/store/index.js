export const state = () => ({
  currentUser: null,
  chatMessages: [],
  roomUsers: null
})

export const getters = {}

export const mutations = {
  setCurrentUser (state, payload) {
    state.currentUser = payload
  },
  setChatMessages (state, payload) {
    Array.isArray(payload) ? state.chatMessages.push(...payload.reverse()) : state.chatMessages.push(payload)
  },
  setRoomUsers (state, payload) {
    state.roomUsers = payload
  }
}

export const actions = {
  getCurrentUser ({ commit }, user) {
    commit('setCurrentUser', user)
  },
  getChatMessages ({ commit }, message) {
    commit('setChatMessages', message)
  },
  getRoomUsers ({ commit }, roomUser) {
    commit('setRoomUsers', roomUser)
  }
}
