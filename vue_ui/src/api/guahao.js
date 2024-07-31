import request from '@/utils/request'

export function findAllGuahaoInfos(params) {
  return request({
    url: '/guahao/findAllGuahaoInfos',
    method: 'get',
    params
  })
}

export function findAllGuahaoInfosBfy() {
  return request({
    url: '/guahao/findAllGuahaoInfosBfy',
    method: 'get',
  })
}

export function delByCoding(params){
  return request({
    url: '/guahao/delByCoding',
    method: 'get',
    params
  })
}

export function findDoctors(params) {
  return request({
    url: '/guahao/findDoctors',
    method: 'get',
    params
  })
}

export function addGuahaoInfo(data) {
  return request({
    url: '/guahao/addGuahaoInfo',
    method: 'post',
    data
  })
}

export function editGuahaoInfo(data) {
  return request({
    url: '/guahao/editGuahaoInfo',
    method: 'post',
    data
  })
}

export function jiuZhen(params) {
  return request({
    url: '/guahao/jiuZhen',
    method: 'get',
    params
  })
}
