import Vue from 'vue'
import HashGenerator from '@/components/HashGenerator'
import { shallowMount } from '@vue/test-utils'

const wrapper = shallowMount(HashGenerator)

describe('HashGenerator', () => {
  // Inspect the raw component options
  it('has a created hook', () => {
    expect(typeof HashGenerator.data).toBe('function')
  })

//  // Evaluate the results of functions in
//  // the raw component options
//  it('sets the correct default data', () => {
//    expect(typeof MyComponent.data).toBe('function')
//    const defaultData = MyComponent.data()
//    expect(defaultData.message).toBe('hello!')
//  })
//
//  // Inspect the component instance on mount
//  it('correctly sets the message when created', () => {
//    expect(wrapper.vm.$data.message).toBe('bye!')
//  })
//
//  // Mount an instance and inspect the render output
//  it('renders the correct message', () => {
//    expect(wrapper.text()).toBe('bye!')
//  })
})
