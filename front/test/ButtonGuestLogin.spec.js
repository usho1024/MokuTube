import { mount } from '@vue/test-utils'
import ButtonGuestLogin from '@/components/Button/ButtonGuestLogin.vue'

describe('ButtonGuestLogin', () => {
  test('is a Vue instance', () => {
    const wrapper = mount(ButtonGuestLogin)
    expect(wrapper.html()).toContain('ゲストログインして今すぐ使ってみる！')
  })
})
