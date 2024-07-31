import request from '@/utils/request'

export function findAllAddFee(params) {
  return request({
    url: '/details/findAllAddFee',
    method: 'get',
    params
  })
}

export function sort(params) {
  return request({
    url: '/drug/sort',
    method: 'get',
    params
  })
}

export function getList(params) {
  return request({
    url: '/drug/findAll',
    method: 'get',
    params
  })
}

export function addTemDrug(temporaryDrug) {
  return request({
    url: '/temporary/addTemDrug',
    method: 'post',
    data: temporaryDrug
  })
}

export function findAllTemDrug(params) {
  return request({
    url: '/temporary/findAllTemDrug',
    method: 'get',
    params
  })
}

export function delTemDrug(id) {
  return request({
    url: '/temporary/delTemDrug',
    method: 'get',
    params:{
      id
    }
  })
}

export function addTemPatient(temporaryInfo) {
  return request({
    url: '/temporary/addTemPatient',
    method: 'post',
    data: temporaryInfo
  })
}
