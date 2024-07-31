import request from '@/utils/request'

export function findTemPat(params) {
  return request({
    url: '/temporary/findTemPat',
    method: 'get',
    params
  })
}

export function findAllTemDrug(params) {
  return request({
    url: '/temporary/findAllTemDrug',
    method: 'get',
    params
  })
}

export function sum(params) {
  return request({
    url: '/temporary/sum',
    method: 'get',
    params
  })
}

export function clearDrug(params) {
  return request({
    url: '/temporary/clearDrug',
    method: 'get',
    params
  })
}

export function clearInfo(params) {
  return request({
    url: '/temporary/clearInfo',
    method: 'get',
    params
  })
}

export function sellDrug(names) {
  return request({ //批量删除
    url: '/details/sellDrug',
    method: 'get',
    params:{names}
  })
}
