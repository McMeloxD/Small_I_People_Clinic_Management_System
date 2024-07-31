import request from '@/utils/request'
import {encrypt} from '@/utils/jsencrypt'

export function login(data) {
  data.password = encrypt(data.password)// 对数据进行加密
  return request({
    url: '/sys/user/login',
    method: 'post',
    data
  })
}

export function upload(data) {
  return request({
    url: '/sys/user/upload',
    method: 'post',
    data
  })
}

export function getInfo(token) {
  return request({
    url: '/sys/user/getInfo',
    method: 'get',
    params: { token }
  })
}

export function logout() {
  return request({
    url: '/sys/user/logout',
    method: 'post'
  })
}

export function findProfileInfo(params) {
  return request({
    url: '/sys/user/findProfileInfo',
    method: 'get',
    params
  })
}

export function saveInfo(data) {
  return request({
    url: '/sys/user/saveInfo',
    method: 'post',
    data
  })
}


export function editPwd(data) {
  data.oldPwd = encrypt(data.oldPwd)
  data.newPwd = encrypt(data.newPwd)
  return request({
    url: '/sys/user/editPwd',
    method: 'post',
    data
  })
}

export function getYuan() {
  return request({
    url: '/md/nested/tu',
    method: 'get',
  })
}
