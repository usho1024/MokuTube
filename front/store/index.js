export const state = () => ({
  currentUser: null,
  chatMessages: [],
  roomUsers: null,
  rooms: null
})

export const getters = {}

export const mutations = {
  setCurrentUser (state, payload) {
    state.currentUser = payload
  },
  setChatMessages (state, payload) {
    if (!payload) {
      state.chatMessages = []
    } else if (Array.isArray(payload)) {
      state.chatMessages.push(...payload.reverse())
    } else {
      state.chatMessages.push(payload)
    }
  },
  setRoomUsers (state, payload) {
    state.roomUsers = payload
  },
  setRooms (state, payload) {
    state.rooms = payload
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
  },
  getRooms ({ commit }, message) {
    commit('setRooms', message)
  }
}
