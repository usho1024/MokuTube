import { config, shallowMount } from '@vue/test-utils'
import RoomPage from '~/pages/rooms/_id'
config.showDeprecationWarnings = false

describe('RoomPage', () => {
  it('ルームの名前を取得できること', () => {
    const wrapper = shallowMount(RoomPage, {
      stubs: ['app-bar-room', 'stay-time-clock', 'youtube'],
      data() {
        return {
          room: {
            id: 1,
            name: 'カフェ',
            image: { name: 'cafe' },
          },
        }
      },
      methods: {
        playVideo() {},
        mute() {},
        scrollToBottom() {},
      },
    })
    expect(wrapper.vm.room.name).toBe('カフェ')
  })
})
