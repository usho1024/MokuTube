export const state = () => ({
  currentUser: null,
  chatMessages: []
})

export const getters = {}

export const mutations = {
  setCurrentUser (state, payload) {
    state.currentUser = payload
  },
  setChatMessages (state, payload) {
    Array.isArray(payload) ? state.chatMessages.push(...payload.reverse()) : state.chatMessages.push(payload)
  }
}

export const actions = {
  getCurrentUser ({ commit }, user) {
    commit('setCurrentUser', user)
  },
  getChatMessages ({ commit }, message) {
    commit('setChatMessages', message)
  }
}
